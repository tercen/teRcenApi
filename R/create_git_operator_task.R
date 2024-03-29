#' CreateGitOperatorTask
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
#' @field version of type String.
#' @field operatorId of type String.
#' @field gitToken of type String.
#' @field testRequired of type bool.
#' @field environment list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field state object of class \code{\link{State}} inherited from super class \code{\link{Task}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field runDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field completedDate object of class \code{\link{Date}} inherited from super class \code{\link{Task}}.
#' @field aclContext object of class \code{\link{AclContext}} inherited from super class \code{\link{Task}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Task}}.
#' @field url object of class \code{\link{Url}}.
CreateGitOperatorTask <- R6::R6Class("CreateGitOperatorTask", inherit = Task, public = list(url = NULL,
    version = NULL, operatorId = NULL, gitToken = NULL, testRequired = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$version = ""
        self$operatorId = ""
        self$gitToken = ""
        self$testRequired = TRUE
        self$url = Url$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$version = json$version
        self$operatorId = json$operatorId
        self$gitToken = json$gitToken
        self$testRequired = json$testRequired
        self$url = createObjectFromJson(json$url)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CreateGitOperatorTask")
        if (!is.null(self$url)) m$url = self$url$toTson()
        m$version = tson.scalar(self$version)
        m$operatorId = tson.scalar(self$operatorId)
        m$gitToken = tson.scalar(self$gitToken)
        m$testRequired = tson.scalar(self$testRequired)
        return(m)
    }))
