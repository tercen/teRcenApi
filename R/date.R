#' Date
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field value of type String.
Date <- R6::R6Class("Date", inherit = Base, public = list(value = NULL, initialize = function(json = NULL) {
    super$initialize(json = json)
}, init = function() {
    super$init()
    self$value = ""
}, initJson = function(json) {
    super$initJson(json)
    self$value = json$value
}, toTson = function() {
    m = super$toTson()
    m$kind = tson.scalar("Date")
    m$value = tson.scalar(self$value)
    return(m)
}))
