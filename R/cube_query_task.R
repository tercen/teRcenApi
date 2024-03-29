#' CubeQueryTask
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{ProjectTask}}, sub classes \code{\link{RunComputationTask}}, \code{\link{SaveComputationResultTask}}, \code{\link{ComputationTask}}.
#' @field projectId of type String inherited from super class \code{\link{ProjectTask}}.
#' @field duration of type double inherited from super class \code{\link{Task}}.
#' @field owner of type String inherited from super class \code{\link{Task}}.
#' @field taskHash of type String inherited from super class \code{\link{Task}}.
#' @field channelId of type String inherited from super class \code{\link{Task}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field removeOnGC of type bool.
#' @field schemaIds list of type String.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field query object of class \code{\link{CubeQuery}}.
CubeQueryTask <- R6::R6Class("CubeQueryTask", inherit = ProjectTask, public = list(query = NULL,
    removeOnGC = NULL, schemaIds = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$removeOnGC = TRUE
        self$schemaIds = list()
        self$query = CubeQuery$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$removeOnGC = json$removeOnGC
        self$schemaIds = json$schemaIds
        self$query = createObjectFromJson(json$query)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CubeQueryTask")
        if (!is.null(self$query)) m$query = self$query$toTson()
        m$removeOnGC = tson.scalar(self$removeOnGC)
        m$schemaIds = lapply(self$schemaIds, function(each) tson.scalar(each))
        return(m)
    }))
