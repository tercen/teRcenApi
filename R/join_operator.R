#' JoinOperator
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field joinType of type String.
#' @field leftPair object of class \code{\link{ColumnPair}}.
#' @field rightRelation object of class \code{\link{Relation}}.
JoinOperator <- R6::R6Class("JoinOperator", inherit = SciObject, public = list(joinType = NULL,
    leftPair = NULL, rightRelation = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$joinType = ""
        self$leftPair = ColumnPair$new()
        self$rightRelation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$joinType = json$joinType
        self$leftPair = createObjectFromJson(json$leftPair)
        self$rightRelation = createObjectFromJson(json$rightRelation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("JoinOperator")
        m$joinType = tson.scalar(self$joinType)
        if (!is.null(self$leftPair)) m$leftPair = self$leftPair$toTson()
        if (!is.null(self$rightRelation)) m$rightRelation = self$rightRelation$toTson()
        return(m)
    }))
