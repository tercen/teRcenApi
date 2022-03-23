#' ProjectDocumentService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{getParentFolders(documentId)}}{method}
#'    \item{\code{clone(documentId,projectId)}}{method}
#' }
#' 
ProjectDocumentService <- R6::R6Class("ProjectDocumentService", inherit = HttpClientService, 
    public = list(initialize = function(baseRestUri, client) {
        super$initialize(baseRestUri, client)
        self$uri = "api/v1/pd"
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
            answer = createObjectFromJson(response$content)
        }
        return(answer)
    }, clone = function(documentId, projectId) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/pd", "/", "clone")
        params = list()
        params[["documentId"]] = unbox(documentId)
        params[["projectId"]] = unbox(projectId)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "clone")
        } else {
            answer = createObjectFromJson(response$content)
        }
        return(answer)
    }))
