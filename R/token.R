#' Token
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field userId of type String.
#' @field token of type String.
#' @field domain of type String.
#' @field expiry object of class \code{\link{Date}}.
Token <- R6::R6Class("Token", inherit = SciObject, public = list(userId = NULL, expiry = NULL,
    token = NULL, domain = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$userId = ""
        self$token = ""
        self$domain = ""
        self$expiry = Date$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$userId = json$userId
        self$token = json$token
        self$domain = json$domain
        self$expiry = createObjectFromJson(json$expiry)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Token")
        m$userId = tson.scalar(self$userId)
        if (!is.null(self$expiry)) m$expiry = self$expiry$toTson()
        m$token = tson.scalar(self$token)
        m$domain = tson.scalar(self$domain)
        return(m)
    }))
