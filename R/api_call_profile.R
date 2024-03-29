#' ApiCallProfile
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Profile}}.
#' @field name of type String inherited from super class \code{\link{Profile}}.
#' @field nCalls of type int.
ApiCallProfile <- R6::R6Class("ApiCallProfile", inherit = Profile, public = list(nCalls = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$nCalls = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$nCalls = json$nCalls
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ApiCallProfile")
        m$nCalls = tson.int(self$nCalls)
        return(m)
    }))
