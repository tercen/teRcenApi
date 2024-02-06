#' OperatorSpec
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field ontologyUri of type String.
#' @field ontologyVersion of type String.
#' @field inputSpecs list of class \code{\link{OperatorInputSpec}}.
#' @field outputSpecs list of class \code{\link{OperatorOutputSpec}}.
OperatorSpec <- R6::R6Class("OperatorSpec", inherit = Base, public = list(ontologyUri = NULL,
    ontologyVersion = NULL, inputSpecs = NULL, outputSpecs = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$ontologyUri = ""
        self$ontologyVersion = ""
        self$inputSpecs = list()
        self$outputSpecs = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$ontologyUri = json$ontologyUri
        self$ontologyVersion = json$ontologyVersion
        self$inputSpecs = lapply(json$inputSpecs, createObjectFromJson)
        self$outputSpecs = lapply(json$outputSpecs, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("OperatorSpec")
        m$ontologyUri = tson.scalar(self$ontologyUri)
        m$ontologyVersion = tson.scalar(self$ontologyVersion)
        m$inputSpecs = lapply(self$inputSpecs, function(each) each$toTson())
        m$outputSpecs = lapply(self$outputSpecs, function(each) each$toTson())
        return(m)
    }))
