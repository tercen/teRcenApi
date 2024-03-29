#' ComputationTask
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{CubeQueryTask}}, sub classes \code{\link{RunComputationTask}}, \code{\link{SaveComputationResultTask}}.
#' @field removeOnGC of type bool inherited from super class \code{\link{CubeQueryTask}}.
#' @field schemaIds list of type String inherited from super class \code{\link{CubeQueryTask}}.
#' @field projectId of type String inherited from super class \code{\link{ProjectTask}}.
#' @field duration of type double inherited from super class \code{\link{Task}}.
#' @field owner of type String inherited from super class \code{\link{Task}}.
#' @field taskHash of type String inherited from super class \code{\link{Task}}.
#' @field channelId of type String inherited from super class \code{\link{Task}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field parentTaskId of type String.
#' @field fileResultId of type String.
#' @field query object of class \code{\link{CubeQuery}} inherited from super class \code{\link{CubeQueryTask}}.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field computedRelation object of class \code{\link{Relation}}.
ComputationTask <- R6::R6Class("ComputationTask", inherit = CubeQueryTask, public = list(parentTaskId = NULL,
    fileResultId = NULL, computedRelation = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$parentTaskId = ""
        self$fileResultId = ""
        self$computedRelation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$parentTaskId = json$parentTaskId
        self$fileResultId = json$fileResultId
        self$computedRelation = createObjectFromJson(json$computedRelation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ComputationTask")
        m$parentTaskId = tson.scalar(self$parentTaskId)
        m$fileResultId = tson.scalar(self$fileResultId)
        if (!is.null(self$computedRelation)) m$computedRelation = self$computedRelation$toTson()
        return(m)
    }))
