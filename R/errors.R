#' Errors
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field factors list of class \code{\link{Factor}}.
Errors <- R6::R6Class("Errors", inherit = SciObject, public = list(factors = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$factors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$factors = lapply(json$factors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Errors")
        m$factors = lapply(self$factors, function(each) each$toTson())
        return(m)
    }))
