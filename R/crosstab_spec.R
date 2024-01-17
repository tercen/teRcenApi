#' CrosstabSpec
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field metaFactors list of class \code{\link{MetaFactor}}.
#' @field axis list of class \code{\link{AxisSpec}}.
CrosstabSpec <- R6::R6Class("CrosstabSpec", inherit = Base, public = list(metaFactors = NULL,
    axis = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$metaFactors = list()
        self$axis = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$metaFactors = lapply(json$metaFactors, createObjectFromJson)
        self$axis = lapply(json$axis, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CrosstabSpec")
        m$metaFactors = lapply(self$metaFactors, function(each) each$toTson())
        m$axis = lapply(self$axis, function(each) each$toTson())
        return(m)
    }))
