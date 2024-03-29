#' RenameRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Relation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field inNames list of type String.
#' @field outNames list of type String.
#' @field relation object of class \code{\link{Relation}}.
RenameRelation <- R6::R6Class("RenameRelation", inherit = Relation, public = list(relation = NULL,
    inNames = NULL, outNames = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$inNames = list()
        self$outNames = list()
        self$relation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$inNames = json$inNames
        self$outNames = json$outNames
        self$relation = createObjectFromJson(json$relation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("RenameRelation")
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        m$inNames = lapply(self$inNames, function(each) tson.scalar(each))
        m$outNames = lapply(self$outNames, function(each) tson.scalar(each))
        return(m)
    }))
