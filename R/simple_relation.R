#' SimpleRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Relation}}, sub classes \code{\link{ReferenceRelation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field index of type int.
SimpleRelation <- R6::R6Class("SimpleRelation", inherit = Relation, public = list(index = NULL, 
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$index = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$index = json$index
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("SimpleRelation")
        m$index = tson.int(self$index)
        return(m)
    }))
