#' OperatorModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{GateOperatorModel}}, \code{\link{AnnotationOperatorModel}}.
OperatorModel <- R6::R6Class("OperatorModel", inherit = SciObject, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("OperatorModel")
    return(m)
}))
