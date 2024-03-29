#' GarbageTasks
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{GarbageObject}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field workflowId of type String.
#' @field deletedTaskIds list of type String.
#' @field addedTaskIds list of type String.
#' @field deletedStepIds list of type String.
GarbageTasks <- R6::R6Class("GarbageTasks", inherit = GarbageObject, public = list(workflowId = NULL,
    deletedTaskIds = NULL, addedTaskIds = NULL, deletedStepIds = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$workflowId = ""
        self$deletedTaskIds = list()
        self$addedTaskIds = list()
        self$deletedStepIds = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$workflowId = json$workflowId
        self$deletedTaskIds = json$deletedTaskIds
        self$addedTaskIds = json$addedTaskIds
        self$deletedStepIds = json$deletedStepIds
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("GarbageTasks")
        m$workflowId = tson.scalar(self$workflowId)
        m$deletedTaskIds = lapply(self$deletedTaskIds, function(each) tson.scalar(each))
        m$addedTaskIds = lapply(self$addedTaskIds, function(each) tson.scalar(each))
        m$deletedStepIds = lapply(self$deletedStepIds, function(each) tson.scalar(each))
        return(m)
    }))
