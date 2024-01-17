#' MetaFactor
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field name of type String.
#' @field description of type String.
#' @field crosstabMapping of type String.
#' @field metaCardinality of type String.
#' @field type of type String.
#' @field ontologyMapping of type String.
#' @field factors list of class \code{\link{Factor}}.
MetaFactor <- R6::R6Class("MetaFactor", inherit = Base, public = list(name = NULL,
    description = NULL, crosstabMapping = NULL, metaCardinality = NULL, type = NULL,
    ontologyMapping = NULL, factors = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$description = ""
        self$crosstabMapping = ""
        self$metaCardinality = ""
        self$type = ""
        self$ontologyMapping = ""
        self$factors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$description = json$description
        self$crosstabMapping = json$crosstabMapping
        self$metaCardinality = json$metaCardinality
        self$type = json$type
        self$ontologyMapping = json$ontologyMapping
        self$factors = lapply(json$factors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("MetaFactor")
        m$name = tson.scalar(self$name)
        m$description = tson.scalar(self$description)
        m$crosstabMapping = tson.scalar(self$crosstabMapping)
        m$metaCardinality = tson.scalar(self$metaCardinality)
        m$type = tson.scalar(self$type)
        m$ontologyMapping = tson.scalar(self$ontologyMapping)
        m$factors = lapply(self$factors, function(each) each$toTson())
        return(m)
    }))
