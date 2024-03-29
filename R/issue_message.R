#' IssueMessage
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{ProjectDocument}}.
#' @field projectId of type String inherited from super class \code{\link{ProjectDocument}}.
#' @field folderId of type String inherited from super class \code{\link{ProjectDocument}}.
#' @field description of type String inherited from super class \code{\link{Document}}.
#' @field name of type String inherited from super class \code{\link{Document}}.
#' @field createdBy of type String inherited from super class \code{\link{Document}}.
#' @field tags list of type String inherited from super class \code{\link{Document}}.
#' @field version of type String inherited from super class \code{\link{Document}}.
#' @field authors list of type String inherited from super class \code{\link{Document}}.
#' @field isPublic of type bool inherited from super class \code{\link{Document}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field issueId of type String.
#' @field body of type String.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
IssueMessage <- R6::R6Class("IssueMessage", inherit = ProjectDocument, public = list(issueId = NULL,
    body = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$issueId = ""
        self$body = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$issueId = json$issueId
        self$body = json$body
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("IssueMessage")
        m$issueId = tson.scalar(self$issueId)
        m$body = tson.scalar(self$body)
        return(m)
    }))
