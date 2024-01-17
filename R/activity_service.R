#' ActivityService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#' }
#' 
ActivityService <- R6::R6Class("ActivityService", inherit = HttpClientService, public = list(initialize = function(baseRestUri,
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/activity"
}, findByUserAndDate = function(startKey = NULL, endKey = NULL, limit = 20, skip = 0,
    descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findByUserAndDate", startKey = startKey, endKey = endKey,
        limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findByTeamAndDate = function(startKey = NULL, endKey = NULL, limit = 20, skip = 0,
    descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findByTeamAndDate", startKey = startKey, endKey = endKey,
        limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findByProjectAndDate = function(startKey = NULL, endKey = NULL, limit = 20, skip = 0,
    descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findByProjectAndDate", startKey = startKey, endKey = endKey,
        limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}))
