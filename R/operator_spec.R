#' OperatorSpec
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field ontologyVersion of type String.
#' @field crosstabSpecs list of class \code{\link{CrosstabSpec}}.
OperatorSpec <- R6::R6Class("OperatorSpec", inherit = Base, public = list(ontologyVersion = NULL,
    crosstabSpecs = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$ontologyVersion = ""
        self$crosstabSpecs = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$ontologyVersion = json$ontologyVersion
        self$crosstabSpecs = lapply(json$crosstabSpecs, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("OperatorSpec")
        m$ontologyVersion = tson.scalar(self$ontologyVersion)
        m$crosstabSpecs = lapply(self$crosstabSpecs, function(each) each$toTson())
        return(m)
    }))
