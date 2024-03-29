#' ExportTableTask
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
#' @field exportName of type String.
#' @field schemaIds list of type String.
#' @field exportType of type String.
#' @field exportToId of type String.
#' @field exportId of type String.
#' @field namespaces list of type String.
#' @field exportedSchemaIds list of type String.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
ExportTableTask <- R6::R6Class("ExportTableTask", inherit = ProjectTask, public = list(exportName = NULL,
    schemaIds = NULL, exportType = NULL, exportToId = NULL, exportId = NULL, namespaces = NULL,
    exportedSchemaIds = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$exportName = ""
        self$schemaIds = list()
        self$exportType = ""
        self$exportToId = ""
        self$exportId = ""
        self$namespaces = list()
        self$exportedSchemaIds = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$exportName = json$exportName
        self$schemaIds = json$schemaIds
        self$exportType = json$exportType
        self$exportToId = json$exportToId
        self$exportId = json$exportId
        self$namespaces = json$namespaces
        self$exportedSchemaIds = json$exportedSchemaIds
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ExportTableTask")
        m$exportName = tson.scalar(self$exportName)
        m$schemaIds = lapply(self$schemaIds, function(each) tson.scalar(each))
        m$exportType = tson.scalar(self$exportType)
        m$exportToId = tson.scalar(self$exportToId)
        m$exportId = tson.scalar(self$exportId)
        m$namespaces = lapply(self$namespaces, function(each) tson.scalar(each))
        m$exportedSchemaIds = lapply(self$exportedSchemaIds, function(each) tson.scalar(each))
        return(m)
    }))
