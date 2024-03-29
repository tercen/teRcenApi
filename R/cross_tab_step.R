#' CrossTabStep
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{NamespaceStep}}, sub classes \code{\link{DataStep}}.
#' @field groupId of type String inherited from super class \code{\link{Step}}.
#' @field name of type String inherited from super class \code{\link{Step}}.
#' @field description of type String inherited from super class \code{\link{Step}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field inputs list of class \code{\link{InputPort}} inherited from super class \code{\link{Step}}.
#' @field outputs list of class \code{\link{OutputPort}} inherited from super class \code{\link{Step}}.
#' @field rectangle object of class \code{\link{Rectangle}} inherited from super class \code{\link{Step}}.
#' @field state object of class \code{\link{StepState}} inherited from super class \code{\link{Step}}.
#' @field model object of class \code{\link{Crosstab}}.
CrossTabStep <- R6::R6Class("CrossTabStep", inherit = NamespaceStep, public = list(model = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$model = Crosstab$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$model = createObjectFromJson(json$model)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CrossTabStep")
        if (!is.null(self$model)) m$model = self$model$toTson()
        return(m)
    }))
