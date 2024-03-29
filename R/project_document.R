#' ProjectDocument
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Document}}, sub classes \code{\link{CubeQueryTableSchema}}, \code{\link{TableSchema}}, \code{\link{ComputedTableSchema}}, \code{\link{FileDocument}}, \code{\link{FolderDocument}}, \code{\link{Schema}}, \code{\link{Workflow}}.
#' @field description of type String inherited from super class \code{\link{Document}}.
#' @field name of type String inherited from super class \code{\link{Document}}.
#' @field tags list of type String inherited from super class \code{\link{Document}}.
#' @field version of type String inherited from super class \code{\link{Document}}.
#' @field isPublic of type bool inherited from super class \code{\link{Document}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field projectId of type String.
#' @field folderId of type String.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
ProjectDocument <- R6::R6Class("ProjectDocument", inherit = Document, public = list(projectId = NULL,
    folderId = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$projectId = ""
        self$folderId = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$projectId = json$projectId
        self$folderId = json$folderId
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ProjectDocument")
        m$projectId = tson.scalar(self$projectId)
        m$folderId = tson.scalar(self$folderId)
        return(m)
    }))
