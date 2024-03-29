#' GroupByRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Relation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field group list of type String.
#' @field relation object of class \code{\link{Relation}}.
GroupByRelation <- R6::R6Class("GroupByRelation", inherit = Relation, public = list(relation = NULL,
    group = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$group = list()
        self$relation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$group = json$group
        self$relation = createObjectFromJson(json$relation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("GroupByRelation")
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        m$group = lapply(self$group, function(each) tson.scalar(each))
        return(m)
    }))
