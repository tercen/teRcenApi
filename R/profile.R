#' Profile
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{StorageProfile}}, \code{\link{RunProfile}}, \code{\link{CpuTimeProfile}}, \code{\link{TableProfile}}, \code{\link{ApiCallProfile}}.
#' @field name of type String.
Profile <- R6::R6Class("Profile", inherit = SciObject, public = list(name = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Profile")
        m$name = tson.scalar(self$name)
        return(m)
    }))
