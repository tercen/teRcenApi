#' CrosstabTable
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field cellSize of type double.
#' @field offset of type int.
#' @field nRows of type int.
#' @field graphicalFactors list of class \code{\link{GraphicalFactor}}.
#' @field rectangleSelections list of class \code{\link{Rectangle}}.
CrosstabTable <- R6::R6Class("CrosstabTable", inherit = SciObject, public = list(cellSize = NULL,
    offset = NULL, graphicalFactors = NULL, rectangleSelections = NULL, nRows = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$cellSize = 0
        self$offset = 0
        self$nRows = 0
        self$graphicalFactors = list()
        self$rectangleSelections = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$cellSize = as.double(json$cellSize)
        self$offset = json$offset
        self$nRows = json$nRows
        self$graphicalFactors = lapply(json$graphicalFactors, createObjectFromJson)
        self$rectangleSelections = lapply(json$rectangleSelections, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CrosstabTable")
        m$cellSize = tson.scalar(self$cellSize)
        m$offset = tson.int(self$offset)
        m$graphicalFactors = lapply(self$graphicalFactors, function(each) each$toTson())
        m$rectangleSelections = lapply(self$rectangleSelections, function(each) each$toTson())
        m$nRows = tson.int(self$nRows)
        return(m)
    }))
