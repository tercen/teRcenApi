#' Token
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field userId of type String.
#' @field token of type String.
#' @field expiry object of class \code{\link{Date}}.
Token <- R6::R6Class("Token", inherit = Base, public = list(userId = NULL, expiry = NULL, 
    token = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$userId = ""
        self$token = ""
        self$expiry = Date$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$userId = json$userId
        self$token = json$token
        self$expiry = createObjectFromJson(json$expiry)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Token")
        m$userId = tson.scalar(self$userId)
        if (!is.null(self$expiry)) m$expiry = self$expiry$toTson()
        m$token = tson.scalar(self$token)
        return(m)
    }))
