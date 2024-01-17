#' AxisSpec
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field metaFactors list of class \code{\link{MetaFactor}}.
AxisSpec <- R6::R6Class("AxisSpec", inherit = Base, public = list(metaFactors = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$metaFactors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$metaFactors = lapply(json$metaFactors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("AxisSpec")
        m$metaFactors = lapply(self$metaFactors, function(each) each$toTson())
        return(m)
    }))
