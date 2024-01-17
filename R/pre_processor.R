#' PreProcessor
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field type of type String.
#' @field operatorRef object of class \code{\link{OperatorRef}}.
PreProcessor <- R6::R6Class("PreProcessor", inherit = SciObject, public = list(type = NULL,
    operatorRef = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$type = ""
        self$operatorRef = OperatorRef$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$type = json$type
        self$operatorRef = createObjectFromJson(json$operatorRef)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("PreProcessor")
        m$type = tson.scalar(self$type)
        if (!is.null(self$operatorRef)) m$operatorRef = self$operatorRef$toTson()
        return(m)
    }))
