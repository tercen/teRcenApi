#' ActivityCount
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field objectId of type String.
#' @field count of type int.
ActivityCount <- R6::R6Class("ActivityCount", inherit = Base, public = list(objectId = NULL,
    count = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$objectId = ""
        self$count = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$objectId = json$objectId
        self$count = json$count
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ActivityCount")
        m$objectId = tson.scalar(self$objectId)
        m$count = tson.int(self$count)
        return(m)
    }))
