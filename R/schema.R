#' Schema
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{ProjectDocument}}, sub classes \code{\link{CubeQueryTableSchema}}, \code{\link{TableSchema}}, \code{\link{ComputedTableSchema}}.
#' @field projectId of type String inherited from super class \code{\link{ProjectDocument}}.
#' @field folderId of type String inherited from super class \code{\link{ProjectDocument}}.
#' @field description of type String inherited from super class \code{\link{Document}}.
#' @field name of type String inherited from super class \code{\link{Document}}.
#' @field tags list of type String inherited from super class \code{\link{Document}}.
#' @field version of type String inherited from super class \code{\link{Document}}.
#' @field isPublic of type bool inherited from super class \code{\link{Document}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field nRows of type int.
#' @field dataDirectory of type String.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field columns list of class \code{\link{ColumnSchema}}.
#' @field relation object of class \code{\link{Relation}}.
Schema <- R6::R6Class("Schema", inherit = ProjectDocument, public = list(nRows = NULL,
    columns = NULL, dataDirectory = NULL, relation = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$nRows = 0
        self$dataDirectory = ""
        self$columns = list()
        self$relation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$nRows = json$nRows
        self$dataDirectory = json$dataDirectory
        self$columns = lapply(json$columns, createObjectFromJson)
        self$relation = createObjectFromJson(json$relation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Schema")
        m$nRows = tson.int(self$nRows)
        m$columns = lapply(self$columns, function(each) each$toTson())
        m$dataDirectory = tson.scalar(self$dataDirectory)
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        return(m)
    }))
