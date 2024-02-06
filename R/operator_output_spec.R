#' OperatorOutputSpec
#'
#' @export
#' @format \code{\link{R6Class}} object.
OperatorOutputSpec <- R6::R6Class("OperatorOutputSpec", inherit = Base, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("OperatorOutputSpec")
    return(m)
}))
