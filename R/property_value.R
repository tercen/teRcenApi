#' PropertyValue
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field name of type String.
#' @field value of type String.
PropertyValue <- R6::R6Class("PropertyValue", inherit = SciObject, public = list(name = NULL,
    value = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$value = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$value = json$value
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("PropertyValue")
        m$name = tson.scalar(self$name)
        m$value = tson.scalar(self$value)
        return(m)
    }))
