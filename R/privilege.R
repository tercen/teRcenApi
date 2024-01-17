#' Privilege
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field type of type String.
Privilege <- R6::R6Class("Privilege", inherit = SciObject, public = list(type = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$type = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$type = json$type
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Privilege")
        m$type = tson.scalar(self$type)
        return(m)
    }))
