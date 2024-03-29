#' Chart
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{ChartLine}}, \code{\link{ChartPoint}}, \code{\link{ChartHeatmap}}, \code{\link{ChartBar}}, \code{\link{ChartSize}}.
#' @field name of type String.
#' @field properties object of class \code{\link{Properties}}.
Chart <- R6::R6Class("Chart", inherit = SciObject, public = list(name = NULL, properties = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$properties = Properties$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$properties = createObjectFromJson(json$properties)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Chart")
        m$name = tson.scalar(self$name)
        if (!is.null(self$properties)) m$properties = self$properties$toTson()
        return(m)
    }))
