#' TaskStateEvent
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{TaskEvent}}.
#' @field taskId of type String inherited from super class \code{\link{TaskEvent}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field date object of class \code{\link{Date}} inherited from super class \code{\link{Event}}.
#' @field state object of class \code{\link{State}}.
TaskStateEvent <- R6::R6Class("TaskStateEvent", inherit = TaskEvent, public = list(state = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$state = State$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$state = createObjectFromJson(json$state)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("TaskStateEvent")
        if (!is.null(self$state)) m$state = self$state$toTson()
        return(m)
    }))
