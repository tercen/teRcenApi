#' RampPalette
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Palette}}, sub classes \code{\link{JetPalette}}.
#' @field backcolor of type int inherited from super class \code{\link{Palette}}.
#' @field isUserDefined of type bool.
#' @field properties list of class \code{\link{PropertyValue}} inherited from super class \code{\link{Palette}}.
#' @field doubleColorElements list of class \code{\link{DoubleColorElement}}.
RampPalette <- R6::R6Class("RampPalette", inherit = Palette, public = list(isUserDefined = NULL,
    doubleColorElements = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$isUserDefined = TRUE
        self$doubleColorElements = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$isUserDefined = json$isUserDefined
        self$doubleColorElements = lapply(json$doubleColorElements, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("RampPalette")
        m$isUserDefined = tson.scalar(self$isUserDefined)
        m$doubleColorElements = lapply(self$doubleColorElements, function(each) each$toTson())
        return(m)
    }))
