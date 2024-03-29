#' CompositeRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Relation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field joinOperators list of class \code{\link{JoinOperator}}.
#' @field mainRelation object of class \code{\link{Relation}}.
CompositeRelation <- R6::R6Class("CompositeRelation", inherit = Relation, public = list(joinOperators = NULL,
    mainRelation = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$joinOperators = list()
        self$mainRelation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$joinOperators = lapply(json$joinOperators, createObjectFromJson)
        self$mainRelation = createObjectFromJson(json$mainRelation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CompositeRelation")
        m$joinOperators = lapply(self$joinOperators, function(each) each$toTson())
        if (!is.null(self$mainRelation)) m$mainRelation = self$mainRelation$toTson()
        return(m)
    }))
