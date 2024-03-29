#' InStep
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{RelationStep}}.
#' @field groupId of type String inherited from super class \code{\link{Step}}.
#' @field name of type String inherited from super class \code{\link{Step}}.
#' @field description of type String inherited from super class \code{\link{Step}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field inputs list of class \code{\link{InputPort}} inherited from super class \code{\link{Step}}.
#' @field outputs list of class \code{\link{OutputPort}} inherited from super class \code{\link{Step}}.
#' @field rectangle object of class \code{\link{Rectangle}} inherited from super class \code{\link{Step}}.
#' @field state object of class \code{\link{StepState}} inherited from super class \code{\link{Step}}.
#' @field groupPortPosition object of class \code{\link{Point}}.
InStep <- R6::R6Class("InStep", inherit = RelationStep, public = list(groupPortPosition = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$groupPortPosition = Point$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$groupPortPosition = createObjectFromJson(json$groupPortPosition)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("InStep")
        if (!is.null(self$groupPortPosition)) m$groupPortPosition = self$groupPortPosition$toTson()
        return(m)
    }))
