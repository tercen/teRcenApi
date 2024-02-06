#' Factor
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{MappingFactor}}, \code{\link{MetaFactor}}, \code{\link{Attribute}}.
#' @field name of type String.
#' @field type of type String.
Factor <- R6::R6Class("Factor", inherit = SciObject, public = list(name = NULL, type = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$type = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$type = json$type
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Factor")
        m$name = tson.scalar(self$name)
        m$type = tson.scalar(self$type)
        return(m)
    }))
