#' OperatorUnitTest
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field name of type String.
#' @field namespace of type String.
#' @field inputFileUris list of type String.
#' @field inputDataUri of type String.
#' @field outputDataUri list of type String.
#' @field columns list of type String.
#' @field rows list of type String.
#' @field colors list of type String.
#' @field labels list of type String.
#' @field yAxis of type String.
#' @field xAxis of type String.
#' @field absTol of type double.
#' @field relTol of type double.
#' @field equalityMethod of type String.
#' @field r2 of type double.
#' @field skipColumns list of type String.
#' @field propertyValues list of class \code{\link{PropertyValue}}.
OperatorUnitTest <- R6::R6Class("OperatorUnitTest", inherit = SciObject, public = list(name = NULL,
    namespace = NULL, propertyValues = NULL, inputFileUris = NULL, inputDataUri = NULL,
    outputDataUri = NULL, columns = NULL, rows = NULL, colors = NULL, labels = NULL,
    yAxis = NULL, xAxis = NULL, absTol = NULL, relTol = NULL, equalityMethod = NULL,
    r2 = NULL, skipColumns = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$namespace = ""
        self$inputFileUris = list()
        self$inputDataUri = ""
        self$outputDataUri = list()
        self$columns = list()
        self$rows = list()
        self$colors = list()
        self$labels = list()
        self$yAxis = ""
        self$xAxis = ""
        self$absTol = 0
        self$relTol = 0
        self$equalityMethod = ""
        self$r2 = 0
        self$skipColumns = list()
        self$propertyValues = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$namespace = json$namespace
        self$inputFileUris = json$inputFileUris
        self$inputDataUri = json$inputDataUri
        self$outputDataUri = json$outputDataUri
        self$columns = json$columns
        self$rows = json$rows
        self$colors = json$colors
        self$labels = json$labels
        self$yAxis = json$yAxis
        self$xAxis = json$xAxis
        self$absTol = as.double(json$absTol)
        self$relTol = as.double(json$relTol)
        self$equalityMethod = json$equalityMethod
        self$r2 = as.double(json$r2)
        self$skipColumns = json$skipColumns
        self$propertyValues = lapply(json$propertyValues, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("OperatorUnitTest")
        m$name = tson.scalar(self$name)
        m$namespace = tson.scalar(self$namespace)
        m$propertyValues = lapply(self$propertyValues, function(each) each$toTson())
        m$inputFileUris = lapply(self$inputFileUris, function(each) tson.scalar(each))
        m$inputDataUri = tson.scalar(self$inputDataUri)
        m$outputDataUri = lapply(self$outputDataUri, function(each) tson.scalar(each))
        m$columns = lapply(self$columns, function(each) tson.scalar(each))
        m$rows = lapply(self$rows, function(each) tson.scalar(each))
        m$colors = lapply(self$colors, function(each) tson.scalar(each))
        m$labels = lapply(self$labels, function(each) tson.scalar(each))
        m$yAxis = tson.scalar(self$yAxis)
        m$xAxis = tson.scalar(self$xAxis)
        m$absTol = tson.scalar(self$absTol)
        m$relTol = tson.scalar(self$relTol)
        m$equalityMethod = tson.scalar(self$equalityMethod)
        m$r2 = tson.scalar(self$r2)
        m$skipColumns = lapply(self$skipColumns, function(each) tson.scalar(each))
        return(m)
    }))
