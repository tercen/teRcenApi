#' StepModel
#'
#' @export
#' @format \code{\link{R6Class}} object, sub classes \code{\link{TableStepModel}}, \code{\link{Crosstab}}, \code{\link{JoinStepModel}}, \code{\link{WizardStepModel}}, \code{\link{MeltStepModel}}, \code{\link{ExportModel}}.
StepModel <- R6::R6Class("StepModel", inherit = Base, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("StepModel")
    return(m)
}))
