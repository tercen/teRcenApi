#' Attribute
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Factor}}.
#' @field name of type String inherited from super class \code{\link{Factor}}.
#' @field type of type String inherited from super class \code{\link{Factor}}.
Attribute <- R6::R6Class("Attribute", inherit = Factor, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("Attribute")
    return(m)
}))
