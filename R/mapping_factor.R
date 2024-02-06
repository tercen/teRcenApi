#' MappingFactor
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{MetaFactor}}.
#' @field description of type String inherited from super class \code{\link{MetaFactor}}.
#' @field ontologyMapping of type String inherited from super class \code{\link{MetaFactor}}.
#' @field crosstabMapping of type String inherited from super class \code{\link{MetaFactor}}.
#' @field cardinality of type String inherited from super class \code{\link{MetaFactor}}.
#' @field name of type String inherited from super class \code{\link{Factor}}.
#' @field type of type String inherited from super class \code{\link{Factor}}.
#' @field factorName of type String.
#' @field isSingle of type bool.
#' @field isRequired of type bool.
#' @field factors list of class \code{\link{Factor}} inherited from super class \code{\link{MetaFactor}}.
MappingFactor <- R6::R6Class("MappingFactor", inherit = MetaFactor, public = list(factorName = NULL,
    isSingle = NULL, isRequired = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$factorName = ""
        self$isSingle = TRUE
        self$isRequired = TRUE
    }, initJson = function(json) {
        super$initJson(json)
        self$factorName = json$factorName
        self$isSingle = json$isSingle
        self$isRequired = json$isRequired
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("MappingFactor")
        m$factorName = tson.scalar(self$factorName)
        m$isSingle = tson.scalar(self$isSingle)
        m$isRequired = tson.scalar(self$isRequired)
        return(m)
    }))
