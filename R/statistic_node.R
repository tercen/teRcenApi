#' StatisticNode
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field name of type String.
#' @field meta list of class \code{\link{Pair}}.
StatisticNode <- R6::R6Class("StatisticNode", inherit = Base, public = list(name = NULL,
    meta = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$meta = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$meta = lapply(json$meta, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("StatisticNode")
        m$name = tson.scalar(self$name)
        m$meta = lapply(self$meta, function(each) each$toTson())
        return(m)
    }))
