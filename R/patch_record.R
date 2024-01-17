#' PatchRecord
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field p of type String.
#' @field t of type String.
#' @field d of type String.
PatchRecord <- R6::R6Class("PatchRecord", inherit = SciObject, public = list(p = NULL,
    t = NULL, d = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$p = ""
        self$t = ""
        self$d = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$p = json$p
        self$t = json$t
        self$d = json$d
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("PatchRecord")
        m$p = tson.scalar(self$p)
        m$t = tson.scalar(self$t)
        m$d = tson.scalar(self$d)
        return(m)
    }))
