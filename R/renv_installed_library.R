#' RenvInstalledLibrary
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{RLibrary}}.
#' @field description of type String inherited from super class \code{\link{Document}}.
#' @field name of type String inherited from super class \code{\link{Document}}.
#' @field tags list of type String inherited from super class \code{\link{Document}}.
#' @field version of type String inherited from super class \code{\link{Document}}.
#' @field isPublic of type bool inherited from super class \code{\link{Document}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field path of type String.
#' @field rDescription object of class \code{\link{RDescription}} inherited from super class \code{\link{RLibrary}}.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
RenvInstalledLibrary <- R6::R6Class("RenvInstalledLibrary", inherit = RLibrary, public = list(path = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$path = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$path = json$path
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("RenvInstalledLibrary")
        m$path = tson.scalar(self$path)
        return(m)
    }))
