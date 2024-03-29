#' DoubleColorElement
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{ColorElement}}.
#' @field color of type int inherited from super class \code{\link{ColorElement}}.
#' @field stringValue of type String.
DoubleColorElement <- R6::R6Class("DoubleColorElement", inherit = ColorElement, public = list(stringValue = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$stringValue = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$stringValue = json$stringValue
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("DoubleColorElement")
        m$stringValue = tson.scalar(self$stringValue)
        return(m)
    }))
