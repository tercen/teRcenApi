#' Url
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field uri of type String.
Url <- R6::R6Class("Url", inherit = SciObject, public = list(uri = NULL, initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
    self$uri = ""
}, initJson = function(json) {
    super$initJson(json)
    self$uri = json$uri
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("Url")
    m$uri = tson.scalar(self$uri)
    return(m)
}))
