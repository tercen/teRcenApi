#' State
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{RunningState}}, \code{\link{RunningDependentState}}, \code{\link{FailedState}}, \code{\link{CanceledState}}, \code{\link{DoneState}}, \code{\link{InitState}}, \code{\link{PendingState}}.
State <- R6::R6Class("State", inherit = SciObject, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("State")
    return(m)
}))
