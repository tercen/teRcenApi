#' ActivityService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{getPublicActivityCount(kind,limit)}}{method}
#' }
#' 
ActivityService <- R6::R6Class("ActivityService", inherit = HttpClientService, public = list(initialize = function(baseRestUri, 
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/activity"
}, getPublicActivityCount = function(kind, limit) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/activity", "/", "getPublicActivityCount")
    params = list()
    params[["kind"]] = unbox(kind)
    params[["limit"]] = unbox(as.integer(limit))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getPublicActivityCount")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}))
