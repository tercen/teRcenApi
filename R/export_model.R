#' ExportModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{StepModel}}.
ExportModel <- R6::R6Class("ExportModel", inherit = StepModel, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("ExportModel")
    return(m)
}))
