#' MeltStepModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{StepModel}}.
#' @field namespace of type String.
#' @field selectionPattern of type String.
#' @field factorType of type String.
#' @field gatherType of type String.
#' @field factors list of class \code{\link{Factor}}.
MeltStepModel <- R6::R6Class("MeltStepModel", inherit = StepModel, public = list(factors = NULL,
    namespace = NULL, selectionPattern = NULL, factorType = NULL, gatherType = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$namespace = ""
        self$selectionPattern = ""
        self$factorType = ""
        self$gatherType = ""
        self$factors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$namespace = json$namespace
        self$selectionPattern = json$selectionPattern
        self$factorType = json$factorType
        self$gatherType = json$gatherType
        self$factors = lapply(json$factors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("MeltStepModel")
        m$factors = lapply(self$factors, function(each) each$toTson())
        m$namespace = tson.scalar(self$namespace)
        m$selectionPattern = tson.scalar(self$selectionPattern)
        m$factorType = tson.scalar(self$factorType)
        m$gatherType = tson.scalar(self$gatherType)
        return(m)
    }))
