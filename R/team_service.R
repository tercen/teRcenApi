#' TeamService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{profiles(teamId)}}{method}
#'    \item{\code{resourceSummary(teamId)}}{method}
#'    \item{\code{transferOwnership(teamIds,newOwner)}}{method}
#' }
#' 
TeamService <- R6::R6Class("TeamService", inherit = HttpClientService, public = list(initialize = function(baseRestUri,
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/team"
}, findTeamByOwner = function(keys = NULL, useFactory = FALSE) {
    return(self$findKeys("teamByOwner", keys = keys, useFactory = useFactory))
}, profiles = function(teamId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/team", "/", "profiles")
    params = list()
    params[["teamId"]] = unbox(teamId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "profiles")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, resourceSummary = function(teamId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/team", "/", "resourceSummary")
    params = list()
    params[["teamId"]] = unbox(teamId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "resourceSummary")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, transferOwnership = function(teamIds, newOwner) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/team", "/", "transferOwnership")
    params = list()
    params[["teamIds"]] = lapply(teamIds, unbox)
    params[["newOwner"]] = unbox(newOwner)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "transferOwnership")
    } else {
        answer = NULL
    }
    return(answer)
}))
