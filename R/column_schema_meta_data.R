#' ColumnSchemaMetaData
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field sort list of type String.
#' @field ascending of type bool.
#' @field quartiles list of type String.
#' @field properties list of class \code{\link{Pair}}.
ColumnSchemaMetaData <- R6::R6Class("ColumnSchemaMetaData", inherit = SciObject,
    public = list(sort = NULL, ascending = NULL, quartiles = NULL, properties = NULL,
        initialize = function(json = NULL) {
            super$initialize(json = json)
        }, init = function() {
            super$init()
            self$sort = list()
            self$ascending = TRUE
            self$quartiles = list()
            self$properties = list()
        }, initJson = function(json) {
            super$initJson(json)
            self$sort = json$sort
            self$ascending = json$ascending
            self$quartiles = json$quartiles
            self$properties = lapply(json$properties, createObjectFromJson)
        }, toTson = function() {
            m = super$toTson()
            m$kind = tson.scalar("ColumnSchemaMetaData")
            m$sort = lapply(self$sort, function(each) tson.scalar(each))
            m$ascending = tson.scalar(self$ascending)
            m$quartiles = lapply(self$quartiles, function(each) tson.scalar(each))
            m$properties = lapply(self$properties, function(each) each$toTson())
            return(m)
        }))
