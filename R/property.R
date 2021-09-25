#' Property
#'
#' @export
#' @format \code{\link{R6Class}} object, sub classes \code{\link{EnumeratedProperty}}, \code{\link{FactorsProperty}}, \code{\link{FormulaProperty}}, \code{\link{DoubleProperty}}, \code{\link{StringProperty}}, \code{\link{BooleanProperty}}.
#' @field name of type String.
#' @field description of type String.
Property <- R6::R6Class("Property", inherit = Base, public = list(name = NULL, description = NULL, 
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$description = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$description = json$description
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Property")
        m$name = tson.scalar(self$name)
        m$description = tson.scalar(self$description)
        return(m)
    }))
