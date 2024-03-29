#' ChartSize
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Chart}}, sub classes \code{\link{ChartLine}}, \code{\link{ChartPoint}}.
#' @field name of type String inherited from super class \code{\link{Chart}}.
#' @field pointSize of type int.
#' @field properties object of class \code{\link{Properties}} inherited from super class \code{\link{Chart}}.
ChartSize <- R6::R6Class("ChartSize", inherit = Chart, public = list(pointSize = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$pointSize = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$pointSize = json$pointSize
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ChartSize")
        m$pointSize = tson.int(self$pointSize)
        return(m)
    }))
