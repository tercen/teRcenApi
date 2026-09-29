# sci#1728 — FileService$upload 409 stale-rev retry
#
# The repo has no other tests and the real deps (teRcenHttp/tson) are heavy,
# so this suite stubs the small surface file_service.R needs, sources the
# service file directly, and drives upload() against a scripted mock client.
#
# RED discipline: on the UNFIXED base (61c9852) cases (a)-(d) FAIL — upload
# throws on the first 409 and never re-GETs/re-posts. Mutation check: setting
# maxRetries = 0 or inverting isUpdateFace must fail these too.

# ---- stubs (must exist before file_service.R is sourced) ----
tson.scalar <- function(x) list(scalar = x)
MultiPart <- R6::R6Class("MultiPart", public = list(
  headers = NULL, content = NULL,
  initialize = function(headers, content = NULL) {
    self$headers <- headers; self$content <- content
  },
  toTson = function() list(headers = self$headers, content = self$content)
))
createObjectFromJson <- function(x) x

HttpClientService <- R6::R6Class("HttpClientService", public = list(
  client = NULL, baseRestUri = "/", uri = NULL,
  initialize = function(baseRestUri, client) {
    self$client <- client
  },
  onResponseError = function(response, msg = "") {
    stop(paste0("Failed : ", msg, " : status=", response$status,
                " body=", toString(response$content)), call. = FALSE)
  },
  getServiceUri = function(uri) paste0(self$baseRestUri, uri),
  # generic document get (id -> object); mock client serves it
  get = function(id) {
    r <- self$client$mockGet(id)
    if (r$failed) stop(paste0("get failed: ", r$status))
    r$content
  }
))

# test_dir runs this file in a child env — the stubs must be visible to the
# sourced file_service.R (and R6 inheritance), so pin them in globalenv().
for (nm in c("tson.scalar", "MultiPart", "createObjectFromJson", "HttpClientService")) {
  assign(nm, get(nm), envir = globalenv())
}

srcFile <- tryCatch(file.path(rprojroot::find_package_root_file(), "R", "file_service.R"),
                    error = function(e) file.path("..", "..", "R", "file_service.R"))
source(srcFile, local = FALSE)

# ---- mock client: scripted multipart responses ----
MockClient <- R6::R6Class("MockClient", public = list(
  responses = NULL, calls = 0, gets = 0,
  initialize = function(responses) self$responses <- responses,
  multipart = function(uri, body) {
    self$calls <- self$calls + 1
    i <- min(self$calls, length(self$responses))
    self$responses[[i]]
  },
  mockGet = function(id) { self$gets <- self$gets + 1; self$private_get },
  private_get = NULL
))

resp <- function(status, content = "body") list(status = status, content = content)
asFile <- function(id, rev) {
  f <- list(id = id, rev = rev)
  f$toTson <- function() list(id = f$id, rev = f$rev)
  f
}

svcFor <- function(mock) FileService$new("http://mock", mock)

test_that("sci#1728 a: 409 once, re-GET fresh rev, retry succeeds", {
  mock <- MockClient$new(list(resp(409, "409, FileDocument.conflict, Document update conflict"), resp(200, "OK-DOC")))
  mock$private_get <- list(failed = FALSE, content = asFile("fid-1", "rev-9"))
  svc <- svcFor(mock)
  answer <- svc$upload(asFile("fid-1", "rev-2"), "BYTES")
  expect_equal(answer, "OK-DOC")
  expect_equal(mock$calls, 2)   # original + one retry
  expect_equal(mock$gets, 1)    # exactly one re-GET
})

test_that("sci#1728 b: persistent 409 exhausts retries, error carries id+revs", {
  mock <- MockClient$new(list(resp(409), resp(409), resp(409), resp(409)))
  mock$private_get <- list(failed = FALSE, content = asFile("fid-1", "rev-9"))
  svc <- svcFor(mock)
  err <- tryCatch(svc$upload(asFile("fid-1", "rev-2"), "BYTES"), error = function(e) conditionMessage(e))
  expect_match(err, "un-retried after 3 attempt")
  expect_match(err, "id=fid-1")
  expect_match(err, "sentRev=rev-2")   # rev seen at call time
  expect_match(err, "retriedRev=rev-9") # fresh rev from the last re-GET
  expect_equal(mock$calls, 4)          # 1 + maxRetries
})

test_that("sci#1728 c: deletion race (re-GET fails) keeps the ORIGINAL 409, no create conversion", {
  mock <- MockClient$new(list(resp(409, "409, FileDocument.conflict")))
  mock$private_get <- list(failed = TRUE, status = 404)
  svc <- svcFor(mock)
  err <- tryCatch(svc$upload(asFile("fid-1", "rev-2"), "BYTES"), error = function(e) conditionMessage(e))
  expect_match(err, "status=409")     # original face preserved (not a create error)
  expect_match(err, "un-retried")     # with forensics
  expect_match(err, "sentRev=rev-2")  # no fresh rev existed — what we sent stands
  expect_equal(mock$calls, 1)                         # never re-posted
})

test_that("sci#1728 d: create-face 409 (empty rev) is NOT retried", {
  mock <- MockClient$new(list(resp(409)))
  svc <- svcFor(mock)
  err <- tryCatch(svc$upload(asFile("", ""), "BYTES"), error = function(e) conditionMessage(e))
  expect_match(err, "Failed : upload : status=409")
  expect_false(grepl("un-retried", err))  # create-face has no forensics suffix
  expect_equal(mock$calls, 1)
  expect_equal(mock$gets, 0)
})

test_that("sci#1728 e: non-409 errors are never retried", {
  mock <- MockClient$new(list(resp(500, "Out of Memory")))
  svc <- svcFor(mock)
  err <- tryCatch(svc$upload(asFile("fid-1", "rev-2"), "BYTES"), error = function(e) conditionMessage(e))
  expect_match(err, "status=500")
  expect_equal(mock$calls, 1)
  expect_equal(mock$gets, 0)
})
