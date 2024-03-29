#' CategoryPalette
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Palette}}.
#' @field backcolor of type int inherited from super class \code{\link{Palette}}.
#' @field properties list of class \code{\link{PropertyValue}} inherited from super class \code{\link{Palette}}.
#' @field colorList object of class \code{\link{ColorList}}.
#' @field stringColorElements list of class \code{\link{StringColorElement}}.
CategoryPalette <- R6::R6Class("CategoryPalette", inherit = Palette, public = list(colorList = NULL,
    stringColorElements = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$colorList = ColorList$new()
        self$stringColorElements = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$colorList = createObjectFromJson(json$colorList)
        self$stringColorElements = lapply(json$stringColorElements, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CategoryPalette")
        if (!is.null(self$colorList)) m$colorList = self$colorList$toTson()
        m$stringColorElements = lapply(self$stringColorElements, function(each) each$toTson())
        return(m)
    }))
