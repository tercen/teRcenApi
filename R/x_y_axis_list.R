#' XYAxisList
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field rectangleSelections list of class \code{\link{Rectangle}}.
#' @field xyAxis list of class \code{\link{XYAxis}}.
XYAxisList <- R6::R6Class("XYAxisList", inherit = SciObject, public = list(rectangleSelections = NULL,
    xyAxis = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$rectangleSelections = list()
        self$xyAxis = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$rectangleSelections = lapply(json$rectangleSelections, createObjectFromJson)
        self$xyAxis = lapply(json$xyAxis, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("XYAxisList")
        m$rectangleSelections = lapply(self$rectangleSelections, function(each) each$toTson())
        m$xyAxis = lapply(self$xyAxis, function(each) each$toTson())
        return(m)
    }))
