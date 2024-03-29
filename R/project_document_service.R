#' ProjectDocumentService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{getParentFolders(documentId)}}{method}
#'    \item{\code{cloneProjectDocument(documentId,projectId)}}{method}
#' }
#' 
ProjectDocumentService <- R6::R6Class("ProjectDocumentService", inherit = HttpClientService,
    public = list(initialize = function(baseRestUri, client) {
        super$initialize(baseRestUri, client)
        self$uri = "api/v1/pd"
    }, findProjectObjectsByLastModifiedDate = function(startKey = NULL, endKey = NULL,
        limit = 20, skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findProjectObjectsByLastModifiedDate", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, findProjectObjectsByFolderAndName = function(startKey = NULL, endKey = NULL,
        limit = 20, skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findProjectObjectsByFolderAndName", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, findFileByLastModifiedDate = function(startKey = NULL, endKey = NULL, limit = 20,
        skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findFileByLastModifiedDate", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, findSchemaByLastModifiedDate = function(startKey = NULL, endKey = NULL, limit = 20,
        skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findSchemaByLastModifiedDate", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, findSchemaByOwnerAndLastModifiedDate = function(startKey = NULL, endKey = NULL,
        limit = 20, skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findSchemaByOwnerAndLastModifiedDate", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, findFileByOwnerAndLastModifiedDate = function(startKey = NULL, endKey = NULL,
        limit = 20, skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findFileByOwnerAndLastModifiedDate", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, getParentFolders = function(documentId) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/pd", "/", "getParentFolders")
        params = list()
        params[["documentId"]] = unbox(documentId)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "getParentFolders")
        } else {
            answer = lapply(response$content, createObjectFromJson)
        }
        return(answer)
    }, cloneProjectDocument = function(documentId, projectId) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/pd", "/", "cloneProjectDocument")
        params = list()
        params[["documentId"]] = unbox(documentId)
        params[["projectId"]] = unbox(projectId)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "cloneProjectDocument")
        } else {
            answer = createObjectFromJson(response$content)
        }
        return(answer)
    }))
