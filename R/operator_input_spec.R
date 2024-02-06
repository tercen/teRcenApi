#' OperatorInputSpec
#'
#' @export
#' @format \code{\link{R6Class}} object, sub classes \code{\link{CrosstabSpec}}.
OperatorInputSpec <- R6::R6Class("OperatorInputSpec", inherit = Base, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("OperatorInputSpec")
    return(m)
}))
