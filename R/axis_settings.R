#' AxisSettings
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @field meta list of class \code{\link{Pair}}.
AxisSettings <- R6::R6Class("AxisSettings", inherit = Base, public = list(meta = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$meta = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$meta = lapply(json$meta, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("AxisSettings")
        m$meta = lapply(self$meta, function(each) each$toTson())
        return(m)
    }))
