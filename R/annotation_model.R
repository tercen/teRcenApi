#' AnnotationModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field taskId of type String.
#' @field factors list of class \code{\link{GraphicalFactor}}.
#' @field annotationFactors list of class \code{\link{GraphicalFactor}}.
#' @field relation object of class \code{\link{Relation}}.
AnnotationModel <- R6::R6Class("AnnotationModel", inherit = SciObject, public = list(factors = NULL,
    annotationFactors = NULL, relation = NULL, taskId = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$taskId = ""
        self$factors = list()
        self$annotationFactors = list()
        self$relation = Relation$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$taskId = json$taskId
        self$factors = lapply(json$factors, createObjectFromJson)
        self$annotationFactors = lapply(json$annotationFactors, createObjectFromJson)
        self$relation = createObjectFromJson(json$relation)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("AnnotationModel")
        m$factors = lapply(self$factors, function(each) each$toTson())
        m$annotationFactors = lapply(self$annotationFactors, function(each) each$toTson())
        if (!is.null(self$relation)) m$relation = self$relation$toTson()
        m$taskId = tson.scalar(self$taskId)
        return(m)
    }))
