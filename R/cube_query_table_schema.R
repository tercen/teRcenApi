#' CubeQueryTableSchema
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Schema}}.
#' @field nRows of type int inherited from super class \code{\link{Schema}}.
#' @field dataDirectory of type String inherited from super class \code{\link{Schema}}.
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
#' @field queryHash of type String.
#' @field queryTableType of type String.
#' @field columns list of class \code{\link{ColumnSchema}} inherited from super class \code{\link{Schema}}.
#' @field relation object of class \code{\link{Relation}} inherited from super class \code{\link{Schema}}.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field query object of class \code{\link{CubeQuery}}.
CubeQueryTableSchema <- R6::R6Class("CubeQueryTableSchema", inherit = Schema, public = list(queryHash = NULL,
    queryTableType = NULL, query = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$queryHash = ""
        self$queryTableType = ""
        self$query = CubeQuery$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$queryHash = json$queryHash
        self$queryTableType = json$queryTableType
        self$query = createObjectFromJson(json$query)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CubeQueryTableSchema")
        m$queryHash = tson.scalar(self$queryHash)
        m$queryTableType = tson.scalar(self$queryTableType)
        if (!is.null(self$query)) m$query = self$query$toTson()
        return(m)
    }))
