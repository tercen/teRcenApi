#' ChartBar
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Chart}}.
#' @field name of type String inherited from super class \code{\link{Chart}}.
#' @field properties object of class \code{\link{Properties}} inherited from super class \code{\link{Chart}}.
ChartBar <- R6::R6Class("ChartBar", inherit = Chart, public = list(initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
}, initJson = function(json) {
    super$initJson(json)
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("ChartBar")
    return(m)
}))
