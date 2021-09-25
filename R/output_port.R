#' OutputPort
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Port}}.
#' @field linkType of type String inherited from super class \code{\link{Port}}.
#' @field name of type String inherited from super class \code{\link{Port}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
OutputPort <- R6::R6Class("OutputPort", inherit = Port, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("OutputPort")
    return(m)
}))
