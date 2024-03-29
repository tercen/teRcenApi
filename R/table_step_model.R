#' TableStepModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{StepModel}}.
#' @field relation object of class \code{\link{Relation}}.
TableStepModel <- R6::R6Class("TableStepModel", inherit = StepModel, public = list(relation = NULL,
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
        m$kind = tson.scalar("TableStepModel")
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        return(m)
    }))
