#' OperatorRef
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field name of type String.
#' @field version of type String.
#' @field operatorId of type String.
#' @field operatorKind of type String.
#' @field propertyValues list of class \code{\link{PropertyValue}}.
#' @field url object of class \code{\link{Url}}.
#' @field operatorSpec object of class \code{\link{OperatorSpec}}.
OperatorRef <- R6::R6Class("OperatorRef", inherit = SciObject, public = list(name = NULL,
    version = NULL, operatorId = NULL, operatorKind = NULL, propertyValues = NULL,
    url = NULL, operatorSpec = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$version = ""
        self$operatorId = ""
        self$operatorKind = ""
        self$propertyValues = list()
        self$url = Url$new()
        self$operatorSpec = OperatorSpec$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$version = json$version
        self$operatorId = json$operatorId
        self$operatorKind = json$operatorKind
        self$propertyValues = lapply(json$propertyValues, createObjectFromJson)
        self$url = createObjectFromJson(json$url)
        self$operatorSpec = createObjectFromJson(json$operatorSpec)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("OperatorRef")
        m$name = tson.scalar(self$name)
        m$version = tson.scalar(self$version)
        m$operatorId = tson.scalar(self$operatorId)
        m$operatorKind = tson.scalar(self$operatorKind)
        m$propertyValues = lapply(self$propertyValues, function(each) each$toTson())
        if (!is.null(self$url)) m$url = self$url$toTson()
        if (!is.null(self$operatorSpec)) m$operatorSpec = self$operatorSpec$toTson()
        return(m)
    }))
