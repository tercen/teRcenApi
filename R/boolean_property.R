#' BooleanProperty
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Property}}.
#' @field name of type String inherited from super class \code{\link{Property}}.
#' @field description of type String inherited from super class \code{\link{Property}}.
#' @field defaultValue of type bool.
BooleanProperty <- R6::R6Class("BooleanProperty", inherit = Property, public = list(defaultValue = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$defaultValue = TRUE
    }, initJson = function(json) {
        super$initJson(json)
        self$defaultValue = json$defaultValue
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("BooleanProperty")
        m$defaultValue = tson.scalar(self$defaultValue)
        return(m)
    }))
