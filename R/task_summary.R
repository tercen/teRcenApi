#' TaskSummary
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field n of type int.
#' @field duration of type double.
TaskSummary <- R6::R6Class("TaskSummary", inherit = SciObject, public = list(n = NULL,
    duration = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$n = 0
        self$duration = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$n = json$n
        self$duration = as.double(json$duration)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("TaskSummary")
        m$n = tson.int(self$n)
        m$duration = tson.scalar(self$duration)
        return(m)
    }))
