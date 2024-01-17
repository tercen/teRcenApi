#' Filters
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field removeNaN of type bool.
#' @field namedFilters list of class \code{\link{NamedFilter}}.
Filters <- R6::R6Class("Filters", inherit = SciObject, public = list(removeNaN = NULL,
    namedFilters = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$removeNaN = TRUE
        self$namedFilters = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$removeNaN = json$removeNaN
        self$namedFilters = lapply(json$namedFilters, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Filters")
        m$removeNaN = tson.scalar(self$removeNaN)
        m$namedFilters = lapply(self$namedFilters, function(each) each$toTson())
        return(m)
    }))
