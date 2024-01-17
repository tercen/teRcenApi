#' StringProperty
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Property}}, sub classes \code{\link{EnumeratedProperty}}, \code{\link{FactorsProperty}}, \code{\link{FormulaProperty}}.
#' @field name of type String inherited from super class \code{\link{Property}}.
#' @field description of type String inherited from super class \code{\link{Property}}.
#' @field defaultValue of type String.
StringProperty <- R6::R6Class("StringProperty", inherit = Property, public = list(defaultValue = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$defaultValue = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$defaultValue = json$defaultValue
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("StringProperty")
        m$defaultValue = tson.scalar(self$defaultValue)
        return(m)
    }))
