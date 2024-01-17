#' OperatorSettings
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field namespace of type String.
#' @field operatorRef object of class \code{\link{OperatorRef}}.
#' @field environment list of class \code{\link{Pair}}.
#' @field operatorModel object of class \code{\link{OperatorModel}}.
OperatorSettings <- R6::R6Class("OperatorSettings", inherit = SciObject, public = list(namespace = NULL,
    operatorRef = NULL, environment = NULL, operatorModel = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$namespace = ""
        self$operatorRef = OperatorRef$new()
        self$environment = list()
        self$operatorModel = OperatorModel$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$namespace = json$namespace
        self$operatorRef = createObjectFromJson(json$operatorRef)
        self$environment = lapply(json$environment, createObjectFromJson)
        self$operatorModel = createObjectFromJson(json$operatorModel)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("OperatorSettings")
        m$namespace = tson.scalar(self$namespace)
        if (!is.null(self$operatorRef)) m$operatorRef = self$operatorRef$toTson()
        m$environment = lapply(self$environment, function(each) each$toTson())
        if (!is.null(self$operatorModel)) m$operatorModel = self$operatorModel$toTson()
        return(m)
    }))
