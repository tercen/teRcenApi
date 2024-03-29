#' ColumnPair
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field lColumns list of type String.
#' @field rColumns list of type String.
ColumnPair <- R6::R6Class("ColumnPair", inherit = SciObject, public = list(lColumns = NULL,
    rColumns = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$lColumns = list()
        self$rColumns = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$lColumns = json$lColumns
        self$rColumns = json$rColumns
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("ColumnPair")
        m$lColumns = lapply(self$lColumns, function(each) tson.scalar(each))
        m$rColumns = lapply(self$rColumns, function(each) tson.scalar(each))
        return(m)
    }))
