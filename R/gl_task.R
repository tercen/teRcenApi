#' GlTask
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Task}}.
#' @field duration of type double inherited from super class \code{\link{Task}}.
#' @field owner of type String inherited from super class \code{\link{Task}}.
#' @field taskHash of type String inherited from super class \code{\link{Task}}.
#' @field channelId of type String inherited from super class \code{\link{Task}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field glQuery of type String.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
GlTask <- R6::R6Class("GlTask", inherit = Task, public = list(glQuery = NULL, initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
    self$glQuery = ""
}, initJson = function(json) {
    super$initJson(json)
    self$glQuery = json$glQuery
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("GlTask")
    m$glQuery = tson.scalar(self$glQuery)
    return(m)
}))
