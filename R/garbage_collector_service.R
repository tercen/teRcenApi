#' GarbageCollectorService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#' }
#' 
GarbageCollectorService <- R6::R6Class("GarbageCollectorService", inherit = HttpClientService,
    public = list(initialize = function(baseRestUri, client) {
        super$initialize(baseRestUri, client)
        self$uri = "api/v1/gc"
    }, findGarbageTasks2ByDate = function(startKey = NULL, endKey = NULL, limit = 20,
        skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findGarbageTasks2ByDate", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }))
