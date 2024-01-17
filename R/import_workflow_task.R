#' ImportWorkflowTask
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{ProjectTask}}, sub classes \code{\link{ImportGitWorkflowTask}}.
#' @field projectId of type String inherited from super class \code{\link{ProjectTask}}.
#' @field duration of type double inherited from super class \code{\link{Task}}.
#' @field owner of type String inherited from super class \code{\link{Task}}.
#' @field taskHash of type String inherited from super class \code{\link{Task}}.
#' @field channelId of type String inherited from super class \code{\link{Task}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field fileId of type String.
#' @field workflowId of type String.
#' @field gitToken of type String.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
ImportWorkflowTask <- R6::R6Class("ImportWorkflowTask", inherit = ProjectTask, public = list(fileId = NULL,
    workflowId = NULL, gitToken = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$fileId = ""
        self$workflowId = ""
        self$gitToken = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$fileId = json$fileId
        self$workflowId = json$workflowId
        self$gitToken = json$gitToken
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ImportWorkflowTask")
        m$fileId = tson.scalar(self$fileId)
        m$workflowId = tson.scalar(self$workflowId)
        m$gitToken = tson.scalar(self$gitToken)
        return(m)
    }))
