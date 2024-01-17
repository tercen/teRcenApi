#' Rectangle
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field extent object of class \code{\link{Point}}.
#' @field topLeft object of class \code{\link{Point}}.
Rectangle <- R6::R6Class("Rectangle", inherit = SciObject, public = list(extent = NULL,
    topLeft = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$extent = Point$new()
        self$topLeft = Point$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$extent = createObjectFromJson(json$extent)
        self$topLeft = createObjectFromJson(json$topLeft)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Rectangle")
        if (!is.null(self$extent)) m$extent = self$extent$toTson()
        if (!is.null(self$topLeft)) m$topLeft = self$topLeft$toTson()
        return(m)
    }))
