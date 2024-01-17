#' AnnotationOperatorModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{OperatorModel}}.
#' @field filters object of class \code{\link{Filters}}.
#' @field annotationModels list of class \code{\link{AnnotationModel}}.
AnnotationOperatorModel <- R6::R6Class("AnnotationOperatorModel", inherit = OperatorModel,
    public = list(filters = NULL, annotationModels = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$filters = Filters$new()
        self$annotationModels = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$filters = createObjectFromJson(json$filters)
        self$annotationModels = lapply(json$annotationModels, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("AnnotationOperatorModel")
        if (!is.null(self$filters)) m$filters = self$filters$toTson()
        m$annotationModels = lapply(self$annotationModels, function(each) each$toTson())
        return(m)
    }))
