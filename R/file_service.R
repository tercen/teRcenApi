#' FileService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{upload(file,bytes)}}{method}
#'    \item{\code{append(file,bytes)}}{method}
#'    \item{\code{download(fileDocumentId)}}{method}
#' }
#' 
FileService <- R6::R6Class("FileService", inherit = HttpClientService, public = list(initialize = function(baseRestUri,
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/file"
}, findFileByWorkflowIdAndStepId = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findFileByWorkflowIdAndStepId", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findByDataUri = function(startKey = NULL, endKey = NULL, limit = 20, skip = 0,
    descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findByDataUri", startKey = startKey, endKey = endKey,
        limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, upload = function(file, bytes, maxRetries = 3) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/file", "/", "upload")
    parts = list()
    parts[[1]] = MultiPart$new(list(`content-type` = tson.scalar("application/json")),
        content = list(file$toTson()))
    if (is.raw(bytes)) {
        parts[[2]] = MultiPart$new(list(`content-type` = tson.scalar("application/octet-stream")),
            content = bytes)
    } else {
        parts[[2]] = MultiPart$new(list(`content-type` = tson.scalar("application/tson")),
            content = bytes)
    }
    response = self$client$multipart(self$getServiceUri(uri), body = lapply(parts,
        function(part) part$toTson()))
    # sci#1728: a 409 on an upload carrying a rev is the stale-rev update
    # face — the server's optimistic-concurrency UPDATE lost a race during
    # the bytes stream. Mirror the server's applyAndUpdate: re-GET a fresh
    # rev and re-upload, bounded (maxRetries, backoff). Retry re-fires only
    # when the re-GET succeeds — a deletion race (GC family, sci#1585)
    # surfaces as the ORIGINAL 409, never as a confusing create. Create-face
    # uploads (empty rev) have nothing to re-read and are not retried.
    initialRev = file$rev
    isUpdateFace = (!is.null(file$id) && nzchar(file$id) && !is.null(file$rev) &&
        nzchar(file$rev))
    attempt = 1
    while (response$status == 409 && isUpdateFace && attempt <= maxRetries) {
        Sys.sleep(min(0.5 * 2^(attempt - 1), 4))
        fresh = tryCatch(self$get(file$id), error = function(e) NULL)
        if (is.null(fresh)) break
        file = fresh
        parts[[1]] = MultiPart$new(list(`content-type` = tson.scalar("application/json")),
            content = list(file$toTson()))
        response = self$client$multipart(self$getServiceUri(uri), body = lapply(parts,
            function(part) part$toTson()))
        attempt = attempt + 1
    }
    if (response$status != 200) {
        if (response$status == 409 && isUpdateFace) {
            # exhaustion / deletion race: carry the forensics triple — worker
            # stderr (the stored task reason) is the durable artifact.
            self$onResponseError(response, paste0("upload : FileDocument.conflict un-retried after ",
                maxRetries, " attempt(s) : id=", file$id, " sentRev=", initialRev,
                " retriedRev=", file$rev))
        }
        self$onResponseError(response, "upload")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, append = function(file, bytes) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/file", "/", "append")
    parts = list()
    parts[[1]] = MultiPart$new(list(`content-type` = tson.scalar("application/json")),
        content = list(file$toTson()))
    if (is.raw(bytes)) {
        parts[[2]] = MultiPart$new(list(`content-type` = tson.scalar("application/octet-stream")),
            content = bytes)
    } else {
        parts[[2]] = MultiPart$new(list(`content-type` = tson.scalar("application/tson")),
            content = bytes)
    }
    response = self$client$multipart(self$getServiceUri(uri), body = lapply(parts,
        function(part) part$toTson()))
    if (response$status != 200) {
        self$onResponseError(response, "append")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, download = function(fileDocumentId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/file", "/", "download")
    params = list()
    params[["fileDocumentId"]] = unbox(fileDocumentId)
    url = self$getServiceUri(uri)
    response = self$client$get(url, query = list(params = toJSON(params)))
    if (response$status != 200) {
        self$onResponseError(response, "download")
    } else {
        answer = response$content
    }
    return(answer)
}))
