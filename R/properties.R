#' Properties
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field properties list of class \code{\link{Property}}.
#' @field propertyValues list of class \code{\link{PropertyValue}}.
Properties <- R6::R6Class("Properties", inherit = SciObject, public = list(properties = NULL,
    propertyValues = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$properties = list()
        self$propertyValues = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$properties = lapply(json$properties, createObjectFromJson)
        self$propertyValues = lapply(json$propertyValues, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Properties")
        m$properties = lapply(self$properties, function(each) each$toTson())
        m$propertyValues = lapply(self$propertyValues, function(each) each$toTson())
        return(m)
    }))
