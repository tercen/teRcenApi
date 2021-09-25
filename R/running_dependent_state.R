#' RunningDependentState
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{State}}.
RunningDependentState <- R6::R6Class("RunningDependentState", inherit = State, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("RunningDependentState")
    return(m)
}))
