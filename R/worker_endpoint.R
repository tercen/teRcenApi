#' WorkerEndpoint
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Document}}.
#' @field description of type String inherited from super class \code{\link{Document}}.
#' @field name of type String inherited from super class \code{\link{Document}}.
#' @field tags list of type String inherited from super class \code{\link{Document}}.
#' @field version of type String inherited from super class \code{\link{Document}}.
#' @field isPublic of type bool inherited from super class \code{\link{Document}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field uri of type String.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
WorkerEndpoint <- R6::R6Class("WorkerEndpoint", inherit = Document, public = list(uri = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$uri = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$uri = json$uri
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("WorkerEndpoint")
        m$uri = tson.scalar(self$uri)
        return(m)
    }))
