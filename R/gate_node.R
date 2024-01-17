#' GateNode
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field nodeId of type String.
#' @field name of type String.
#' @field crosstab object of class \code{\link{Crosstab}}.
#' @field children list of class \code{\link{GateNode}}.
#' @field statistics list of class \code{\link{StatisticNode}}.
GateNode <- R6::R6Class("GateNode", inherit = SciObject, public = list(nodeId = NULL,
    name = NULL, crosstab = NULL, children = NULL, statistics = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$nodeId = ""
        self$name = ""
        self$crosstab = Crosstab$new()
        self$children = list()
        self$statistics = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$nodeId = json$nodeId
        self$name = json$name
        self$crosstab = createObjectFromJson(json$crosstab)
        self$children = lapply(json$children, createObjectFromJson)
        self$statistics = lapply(json$statistics, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("GateNode")
        m$nodeId = tson.scalar(self$nodeId)
        m$name = tson.scalar(self$name)
        if (!is.null(self$crosstab)) m$crosstab = self$crosstab$toTson()
        m$children = lapply(self$children, function(each) each$toTson())
        m$statistics = lapply(self$statistics, function(each) each$toTson())
        return(m)
    }))
