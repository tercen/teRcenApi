#' MetaFactor
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Factor}}, sub classes \code{\link{MappingFactor}}.
#' @field name of type String inherited from super class \code{\link{Factor}}.
#' @field type of type String inherited from super class \code{\link{Factor}}.
#' @field description of type String.
#' @field ontologyMapping of type String.
#' @field crosstabMapping of type String.
#' @field cardinality of type String.
#' @field factors list of class \code{\link{Factor}}.
MetaFactor <- R6::R6Class("MetaFactor", inherit = Factor, public = list(description = NULL,
    ontologyMapping = NULL, crosstabMapping = NULL, cardinality = NULL, factors = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$description = ""
        self$ontologyMapping = ""
        self$crosstabMapping = ""
        self$cardinality = ""
        self$factors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$description = json$description
        self$ontologyMapping = json$ontologyMapping
        self$crosstabMapping = json$crosstabMapping
        self$cardinality = json$cardinality
        self$factors = lapply(json$factors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("MetaFactor")
        m$description = tson.scalar(self$description)
        m$ontologyMapping = tson.scalar(self$ontologyMapping)
        m$crosstabMapping = tson.scalar(self$crosstabMapping)
        m$cardinality = tson.scalar(self$cardinality)
        m$factors = lapply(self$factors, function(each) each$toTson())
        return(m)
    }))
