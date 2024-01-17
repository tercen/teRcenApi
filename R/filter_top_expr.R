#' FilterTopExpr
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{NamedFilter}}, \code{\link{FilterExpr2d}}, \code{\link{Filter}}, \code{\link{FilterExpr}}.
FilterTopExpr <- R6::R6Class("FilterTopExpr", inherit = SciObject, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("FilterTopExpr")
    return(m)
}))
