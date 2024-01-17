#' DocumentService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{search(query,limit,useFactory,bookmark)}}{method}
#'    \item{\code{getLibrary(projectId,teamIds,docTypes,tags,offset,limit)}}{method}
#'    \item{\code{getTercenLibrary(offset,limit)}}{method}
#'    \item{\code{getTercenOperatorLibrary(offset,limit)}}{method}
#'    \item{\code{getTercenWorkflowLibrary(offset,limit)}}{method}
#'    \item{\code{getTercenAppLibrary(offset,limit)}}{method}
#'    \item{\code{getTercenDatasetLibrary(offset,limit)}}{method}
#' }
#' 
DocumentService <- R6::R6Class("DocumentService", inherit = HttpClientService, public = list(initialize = function(baseRestUri,
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/d"
}, findWorkflowByTagOwnerCreatedDate = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findWorkflowByTagOwnerCreatedDate", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findProjectByOwnersAndName = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findProjectByOwnersAndName", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findProjectByOwnersAndCreatedDate = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findProjectByOwnersAndCreatedDate", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findOperatorByOwnerLastModifiedDate = function(startKey = NULL, endKey = NULL,
    limit = 20, skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findOperatorByOwnerLastModifiedDate", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findOperatorByUrlAndVersion = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findOperatorByUrlAndVersion", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, search = function(query, limit, useFactory, bookmark) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "search")
    params = list()
    params[["query"]] = unbox(query)
    params[["limit"]] = unbox(as.integer(limit))
    params[["useFactory"]] = unbox(useFactory)
    params[["bookmark"]] = unbox(bookmark)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "search")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, getLibrary = function(projectId, teamIds, docTypes, tags, offset, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "getLibrary")
    params = list()
    params[["projectId"]] = unbox(projectId)
    params[["teamIds"]] = lapply(teamIds, unbox)
    params[["docTypes"]] = lapply(docTypes, unbox)
    params[["tags"]] = lapply(tags, unbox)
    params[["offset"]] = unbox(as.integer(offset))
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getLibrary")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTercenLibrary = function(offset, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "getTercenLibrary")
    params = list()
    params[["offset"]] = unbox(as.integer(offset))
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTercenLibrary")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTercenOperatorLibrary = function(offset, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "getTercenOperatorLibrary")
    params = list()
    params[["offset"]] = unbox(as.integer(offset))
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTercenOperatorLibrary")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTercenWorkflowLibrary = function(offset, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "getTercenWorkflowLibrary")
    params = list()
    params[["offset"]] = unbox(as.integer(offset))
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTercenWorkflowLibrary")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTercenAppLibrary = function(offset, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "getTercenAppLibrary")
    params = list()
    params[["offset"]] = unbox(as.integer(offset))
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTercenAppLibrary")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTercenDatasetLibrary = function(offset, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/d", "/", "getTercenDatasetLibrary")
    params = list()
    params[["offset"]] = unbox(as.integer(offset))
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTercenDatasetLibrary")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}))
