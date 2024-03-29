#' FilterExpr
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{FilterTopExpr}}, sub classes \code{\link{FilterExpr2d}}.
#' @field filterOp of type String.
#' @field stringValue of type String.
#' @field factor object of class \code{\link{Factor}}.
FilterExpr <- R6::R6Class("FilterExpr", inherit = FilterTopExpr, public = list(filterOp = NULL,
    stringValue = NULL, factor = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$filterOp = ""
        self$stringValue = ""
        self$factor = Factor$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$filterOp = json$filterOp
        self$stringValue = json$stringValue
        self$factor = createObjectFromJson(json$factor)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("FilterExpr")
        m$filterOp = tson.scalar(self$filterOp)
        m$stringValue = tson.scalar(self$stringValue)
        if (!is.null(self$factor)) m$factor = self$factor$toTson()
        return(m)
    }))
