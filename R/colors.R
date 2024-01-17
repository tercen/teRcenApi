#' Colors
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field factors list of class \code{\link{Factor}}.
#' @field palette object of class \code{\link{Palette}}.
Colors <- R6::R6Class("Colors", inherit = SciObject, public = list(factors = NULL,
    palette = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$factors = list()
        self$palette = Palette$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$factors = lapply(json$factors, createObjectFromJson)
        self$palette = createObjectFromJson(json$palette)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Colors")
        m$factors = lapply(self$factors, function(each) each$toTson())
        if (!is.null(self$palette)) m$palette = self$palette$toTson()
        return(m)
    }))
