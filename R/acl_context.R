#' AclContext
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field username of type String.
#' @field domain of type String.
AclContext <- R6::R6Class("AclContext", inherit = SciObject, public = list(username = NULL,
    domain = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$username = ""
        self$domain = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$username = json$username
        self$domain = json$domain
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("AclContext")
        m$username = tson.scalar(self$username)
        m$domain = tson.scalar(self$domain)
        return(m)
    }))
