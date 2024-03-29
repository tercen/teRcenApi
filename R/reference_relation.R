#' ReferenceRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Relation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field relation object of class \code{\link{Relation}}.
ReferenceRelation <- R6::R6Class("ReferenceRelation", inherit = Relation, public = list(relation = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$relation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$relation = createObjectFromJson(json$relation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ReferenceRelation")
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        return(m)
    }))
