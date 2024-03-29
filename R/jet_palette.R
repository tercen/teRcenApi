#' JetPalette
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{RampPalette}}.
#' @field isUserDefined of type bool inherited from super class \code{\link{RampPalette}}.
#' @field backcolor of type int inherited from super class \code{\link{Palette}}.
#' @field doubleColorElements list of class \code{\link{DoubleColorElement}} inherited from super class \code{\link{RampPalette}}.
#' @field properties list of class \code{\link{PropertyValue}} inherited from super class \code{\link{Palette}}.
JetPalette <- R6::R6Class("JetPalette", inherit = RampPalette, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("JetPalette")
    return(m)
}))
