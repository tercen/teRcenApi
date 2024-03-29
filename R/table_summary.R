#' TableSummary
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field n of type int.
#' @field size of type int.
#' @field nr of type int.
#' @field nc of type int.
TableSummary <- R6::R6Class("TableSummary", inherit = SciObject, public = list(n = NULL,
    size = NULL, nr = NULL, nc = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$n = 0
        self$size = 0
        self$nr = 0
        self$nc = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$n = json$n
        self$size = json$size
        self$nr = json$nr
        self$nc = json$nc
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("TableSummary")
        m$n = tson.int(self$n)
        m$size = tson.int(self$size)
        m$nr = tson.int(self$nr)
        m$nc = tson.int(self$nc)
        return(m)
    }))
