#' CubeAxisQuery
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field pointSize of type int.
#' @field chartType of type String.
#' @field yAxis object of class \code{\link{Factor}}.
#' @field yAxisSettings object of class \code{\link{AxisSettings}}.
#' @field xAxis object of class \code{\link{Factor}}.
#' @field xAxisSettings object of class \code{\link{AxisSettings}}.
#' @field errors list of class \code{\link{Factor}}.
#' @field labels list of class \code{\link{Factor}}.
#' @field colors list of class \code{\link{Factor}}.
#' @field preprocessors list of class \code{\link{PreProcessor}}.
CubeAxisQuery <- R6::R6Class("CubeAxisQuery", inherit = Base, public = list(pointSize = NULL,
    chartType = NULL, yAxis = NULL, yAxisSettings = NULL, xAxis = NULL, xAxisSettings = NULL,
    errors = NULL, labels = NULL, colors = NULL, preprocessors = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$pointSize = 0
        self$chartType = ""
        self$yAxis = Factor$new()
        self$yAxisSettings = AxisSettings$new()
        self$xAxis = Factor$new()
        self$xAxisSettings = AxisSettings$new()
        self$errors = list()
        self$labels = list()
        self$colors = list()
        self$preprocessors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$pointSize = json$pointSize
        self$chartType = json$chartType
        self$yAxis = createObjectFromJson(json$yAxis)
        self$yAxisSettings = createObjectFromJson(json$yAxisSettings)
        self$xAxis = createObjectFromJson(json$xAxis)
        self$xAxisSettings = createObjectFromJson(json$xAxisSettings)
        self$errors = lapply(json$errors, createObjectFromJson)
        self$labels = lapply(json$labels, createObjectFromJson)
        self$colors = lapply(json$colors, createObjectFromJson)
        self$preprocessors = lapply(json$preprocessors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CubeAxisQuery")
        m$pointSize = tson.int(self$pointSize)
        m$chartType = tson.scalar(self$chartType)
        if (!is.null(self$yAxis)) m$yAxis = self$yAxis$toTson()
        if (!is.null(self$yAxisSettings)) m$yAxisSettings = self$yAxisSettings$toTson()
        if (!is.null(self$xAxis)) m$xAxis = self$xAxis$toTson()
        if (!is.null(self$xAxisSettings)) m$xAxisSettings = self$xAxisSettings$toTson()
        m$errors = lapply(self$errors, function(each) each$toTson())
        m$labels = lapply(self$labels, function(each) each$toTson())
        m$colors = lapply(self$colors, function(each) each$toTson())
        m$preprocessors = lapply(self$preprocessors, function(each) each$toTson())
        return(m)
    }))
