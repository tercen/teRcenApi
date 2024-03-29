#' Pair
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field key of type String.
#' @field value of type String.
Pair <- R6::R6Class("Pair", inherit = SciObject, public = list(key = NULL, value = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$key = ""
        self$value = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$key = json$key
        self$value = json$value
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Pair")
        m$key = tson.scalar(self$key)
        m$value = tson.scalar(self$value)
        return(m)
    }))
