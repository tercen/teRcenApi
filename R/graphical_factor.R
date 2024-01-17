#' GraphicalFactor
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field factor object of class \code{\link{Factor}}.
#' @field rectangle object of class \code{\link{Rectangle}}.
GraphicalFactor <- R6::R6Class("GraphicalFactor", inherit = SciObject, public = list(factor = NULL,
    rectangle = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$factor = Factor$new()
        self$rectangle = Rectangle$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$factor = createObjectFromJson(json$factor)
        self$rectangle = createObjectFromJson(json$rectangle)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("GraphicalFactor")
        if (!is.null(self$factor)) m$factor = self$factor$toTson()
        if (!is.null(self$rectangle)) m$rectangle = self$rectangle$toTson()
        return(m)
    }))
