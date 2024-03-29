#' ColorElement
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{DoubleColorElement}}, \code{\link{StringColorElement}}.
#' @field color of type int.
ColorElement <- R6::R6Class("ColorElement", inherit = SciObject, public = list(color = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$color = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$color = json$color
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ColorElement")
        m$color = tson.int(self$color)
        return(m)
    }))
