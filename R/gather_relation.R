#' GatherRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Relation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field names list of type String.
#' @field valueName of type String.
#' @field variableName of type String.
#' @field valueType of type String.
#' @field gatherType of type String.
#' @field relation object of class \code{\link{Relation}}.
GatherRelation <- R6::R6Class("GatherRelation", inherit = Relation, public = list(relation = NULL,
    names = NULL, valueName = NULL, variableName = NULL, valueType = NULL, gatherType = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$names = list()
        self$valueName = ""
        self$variableName = ""
        self$valueType = ""
        self$gatherType = ""
        self$relation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$names = json$names
        self$valueName = json$valueName
        self$variableName = json$variableName
        self$valueType = json$valueType
        self$gatherType = json$gatherType
        self$relation = createObjectFromJson(json$relation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("GatherRelation")
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        m$names = lapply(self$names, function(each) tson.scalar(each))
        m$valueName = tson.scalar(self$valueName)
        m$variableName = tson.scalar(self$variableName)
        m$valueType = tson.scalar(self$valueType)
        m$gatherType = tson.scalar(self$gatherType)
        return(m)
    }))
