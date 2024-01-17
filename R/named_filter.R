#' NamedFilter
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Filter}}.
#' @field logical of type String inherited from super class \code{\link{Filter}}.
#' @field not of type bool inherited from super class \code{\link{Filter}}.
#' @field name of type String.
#' @field filterExprs list of class \code{\link{FilterTopExpr}} inherited from super class \code{\link{Filter}}.
#' @field meta list of class \code{\link{Pair}}.
NamedFilter <- R6::R6Class("NamedFilter", inherit = Filter, public = list(meta = NULL,
    name = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
        self$meta = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
        self$meta = lapply(json$meta, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("NamedFilter")
        m$meta = lapply(self$meta, function(each) each$toTson())
        m$name = tson.scalar(self$name)
        return(m)
    }))
