#' StepState
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field taskId of type String.
#' @field taskState object of class \code{\link{State}}.
StepState <- R6::R6Class("StepState", inherit = SciObject, public = list(taskId = NULL,
    taskState = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$taskId = ""
        self$taskState = State$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$taskId = json$taskId
        self$taskState = createObjectFromJson(json$taskState)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("StepState")
        m$taskId = tson.scalar(self$taskId)
        if (!is.null(self$taskState)) m$taskState = self$taskState$toTson()
        return(m)
    }))
