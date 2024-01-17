#' Point
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field x of type double.
#' @field y of type double.
Point <- R6::R6Class("Point", inherit = SciObject, public = list(x = NULL, y = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$x = 0
        self$y = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$x = as.double(json$x)
        self$y = as.double(json$y)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Point")
        m$x = tson.scalar(self$x)
        m$y = tson.scalar(self$y)
        return(m)
    }))
