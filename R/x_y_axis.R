#' XYAxis
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field taskId of type String.
#' @field chart object of class \code{\link{Chart}}.
#' @field colors object of class \code{\link{Colors}}.
#' @field errors object of class \code{\link{Errors}}.
#' @field labels object of class \code{\link{Labels}}.
#' @field xAxis object of class \code{\link{Axis}}.
#' @field yAxis object of class \code{\link{Axis}}.
#' @field preprocessors list of class \code{\link{PreProcessor}}.
XYAxis <- R6::R6Class("XYAxis", inherit = SciObject, public = list(chart = NULL,
    colors = NULL, errors = NULL, labels = NULL, xAxis = NULL, yAxis = NULL, taskId = NULL,
    preprocessors = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$taskId = ""
        self$chart = Chart$new()
        self$colors = Colors$new()
        self$errors = Errors$new()
        self$labels = Labels$new()
        self$xAxis = Axis$new()
        self$yAxis = Axis$new()
        self$preprocessors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$taskId = json$taskId
        self$chart = createObjectFromJson(json$chart)
        self$colors = createObjectFromJson(json$colors)
        self$errors = createObjectFromJson(json$errors)
        self$labels = createObjectFromJson(json$labels)
        self$xAxis = createObjectFromJson(json$xAxis)
        self$yAxis = createObjectFromJson(json$yAxis)
        self$preprocessors = lapply(json$preprocessors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("XYAxis")
        if (!is.null(self$chart)) m$chart = self$chart$toTson()
        if (!is.null(self$colors)) m$colors = self$colors$toTson()
        if (!is.null(self$errors)) m$errors = self$errors$toTson()
        if (!is.null(self$labels)) m$labels = self$labels$toTson()
        if (!is.null(self$xAxis)) m$xAxis = self$xAxis$toTson()
        if (!is.null(self$yAxis)) m$yAxis = self$yAxis$toTson()
        m$taskId = tson.scalar(self$taskId)
        m$preprocessors = lapply(self$preprocessors, function(each) each$toTson())
        return(m)
    }))
