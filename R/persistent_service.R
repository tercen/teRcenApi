#' PersistentService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{createNewIds(n)}}{method}
#'    \item{\code{summary(teamOrProjectId)}}{method}
#'    \item{\code{getDependentObjects(id)}}{method}
#'    \item{\code{getDependentObjectIds(id)}}{method}
#' }
#' 
PersistentService <- R6::R6Class("PersistentService", inherit = HttpClientService,
    public = list(initialize = function(baseRestUri, client) {
        super$initialize(baseRestUri, client)
        self$uri = "api/v1/po"
    }, findDeleted = function(keys = NULL, useFactory = FALSE) {
        return(self$findKeys("findDeleted", keys = keys, useFactory = useFactory))
    }, findByKind = function(keys = NULL, useFactory = FALSE) {
        return(self$findKeys("findByKind", keys = keys, useFactory = useFactory))
    }, createNewIds = function(n) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/po", "/", "createNewIds")
        params = list()
        params[["n"]] = unbox(as.integer(n))
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "createNewIds")
        } else {
            answer = lapply(response$content, createObjectFromJson)
        }
        return(answer)
    }, summary = function(teamOrProjectId) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/po", "/", "summary")
        params = list()
        params[["teamOrProjectId"]] = unbox(teamOrProjectId)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "summary")
        } else {
            answer = createObjectFromJson(response$content)
        }
        return(answer)
    }, getDependentObjects = function(id) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/po", "/", "getDependentObjects")
        params = list()
        params[["id"]] = unbox(id)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "getDependentObjects")
        } else {
            answer = lapply(response$content, createObjectFromJson)
        }
        return(answer)
    }, getDependentObjectIds = function(id) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/po", "/", "getDependentObjectIds")
        params = list()
        params[["id"]] = unbox(id)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "getDependentObjectIds")
        } else {
            answer = lapply(response$content, createObjectFromJson)
        }
        return(answer)
    }))
