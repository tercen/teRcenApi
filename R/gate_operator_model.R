#' GateOperatorModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{OperatorModel}}.
#' @field roots list of class \code{\link{GateNode}}.
GateOperatorModel <- R6::R6Class("GateOperatorModel", inherit = OperatorModel, public = list(roots = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$roots = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$roots = lapply(json$roots, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("GateOperatorModel")
        m$roots = lapply(self$roots, function(each) each$toTson())
        return(m)
    }))
