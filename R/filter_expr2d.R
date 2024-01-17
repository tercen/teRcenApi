#' FilterExpr2d
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{FilterExpr}}.
#' @field filterOp of type String inherited from super class \code{\link{FilterExpr}}.
#' @field stringValue of type String inherited from super class \code{\link{FilterExpr}}.
#' @field factor object of class \code{\link{Factor}} inherited from super class \code{\link{FilterExpr}}.
#' @field factor2 object of class \code{\link{Factor}}.
FilterExpr2d <- R6::R6Class("FilterExpr2d", inherit = FilterExpr, public = list(factor2 = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$factor2 = Factor$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$factor2 = createObjectFromJson(json$factor2)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("FilterExpr2d")
        if (!is.null(self$factor2)) m$factor2 = self$factor2$toTson()
        return(m)
    }))
