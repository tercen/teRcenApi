#' JoinStepModel
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{StepModel}}.
#' @field rightPrefix of type String.
#' @field joinType of type String.
#' @field leftFactors list of class \code{\link{Factor}}.
#' @field rightFactors list of class \code{\link{Factor}}.
JoinStepModel <- R6::R6Class("JoinStepModel", inherit = StepModel, public = list(leftFactors = NULL,
    rightFactors = NULL, rightPrefix = NULL, joinType = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$rightPrefix = ""
        self$joinType = ""
        self$leftFactors = list()
        self$rightFactors = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$rightPrefix = json$rightPrefix
        self$joinType = json$joinType
        self$leftFactors = lapply(json$leftFactors, createObjectFromJson)
        self$rightFactors = lapply(json$rightFactors, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("JoinStepModel")
        m$leftFactors = lapply(self$leftFactors, function(each) each$toTson())
        m$rightFactors = lapply(self$rightFactors, function(each) each$toTson())
        m$rightPrefix = tson.scalar(self$rightPrefix)
        m$joinType = tson.scalar(self$joinType)
        return(m)
    }))
