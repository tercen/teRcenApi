#' RunWebAppTask
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{ProjectTask}}.
#' @field projectId of type String inherited from super class \code{\link{ProjectTask}}.
#' @field duration of type double inherited from super class \code{\link{Task}}.
#' @field owner of type String inherited from super class \code{\link{Task}}.
#' @field taskHash of type String inherited from super class \code{\link{Task}}.
#' @field channelId of type String inherited from super class \code{\link{Task}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field operatorId of type String.
#' @field cubeQueryTaskId of type String.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field url object of class \code{\link{Url}}.
RunWebAppTask <- R6::R6Class("RunWebAppTask", inherit = ProjectTask, public = list(operatorId = NULL,
    cubeQueryTaskId = NULL, url = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$operatorId = ""
        self$cubeQueryTaskId = ""
        self$url = Url$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$operatorId = json$operatorId
        self$cubeQueryTaskId = json$cubeQueryTaskId
        self$url = createObjectFromJson(json$url)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("RunWebAppTask")
        m$operatorId = tson.scalar(self$operatorId)
        m$cubeQueryTaskId = tson.scalar(self$cubeQueryTaskId)
        if (!is.null(self$url)) m$url = self$url$toTson()
        return(m)
    }))
