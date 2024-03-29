#' TableProperties
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field name of type String.
#' @field sortOrder list of type String.
#' @field ascending of type bool.
TableProperties <- R6::R6Class("TableProperties", inherit = SciObject, public = list(name = NULL,
    sortOrder = NULL, ascending = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$sortOrder = list()
        self$ascending = TRUE
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$sortOrder = json$sortOrder
        self$ascending = json$ascending
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("TableProperties")
        m$name = tson.scalar(self$name)
        m$sortOrder = lapply(self$sortOrder, function(each) tson.scalar(each))
        m$ascending = tson.scalar(self$ascending)
        return(m)
    }))
