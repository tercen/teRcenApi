#' AppDesign
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field namespace of type String.
#' @field description of type String.
#' @field name of type String.
#' @field type of type String.
#' @field factors list of class \code{\link{MappingFactor}}.
#' @field filters list of class \code{\link{MappingFilter}}.
AppDesign <- R6::R6Class("AppDesign", inherit = Base, public = list(namespace = NULL, 
    description = NULL, name = NULL, type = NULL, factors = NULL, filters = NULL, 
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$namespace = ""
        self$description = ""
        self$name = ""
        self$type = ""
        self$factors = list()
        self$filters = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$namespace = json$namespace
        self$description = json$description
        self$name = json$name
        self$type = json$type
        self$factors = lapply(json$factors, createObjectFromJson)
        self$filters = lapply(json$filters, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("AppDesign")
        m$namespace = tson.scalar(self$namespace)
        m$description = tson.scalar(self$description)
        m$name = tson.scalar(self$name)
        m$type = tson.scalar(self$type)
        m$factors = lapply(self$factors, function(each) each$toTson())
        m$filters = lapply(self$filters, function(each) each$toTson())
        return(m)
    }))
