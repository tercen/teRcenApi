#' CanceledState
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{State}}.
CanceledState <- R6::R6Class("CanceledState", inherit = State, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("CanceledState")
    return(m)
}))
