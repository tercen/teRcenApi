#' CpuTimeProfile
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Profile}}.
#' @field name of type String inherited from super class \code{\link{Profile}}.
#' @field cpuTime of type double.
CpuTimeProfile <- R6::R6Class("CpuTimeProfile", inherit = Profile, public = list(cpuTime = NULL, 
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$cpuTime = 0
    }, initJson = function(json) {
        super$initJson(json)
        self$cpuTime = as.double(json$cpuTime)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("CpuTimeProfile")
        m$cpuTime = tson.scalar(self$cpuTime)
        return(m)
    }))
