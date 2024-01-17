#' TableRelation
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SimpleRelation}}.
#' @field index of type int inherited from super class \code{\link{SimpleRelation}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field nRows of type int.
#' @field data_dir of type String.
#' @field meta_data list of class \code{\link{Pair}}.
#' @field attributes list of class \code{\link{Attribute}}.
TableRelation <- R6::R6Class("TableRelation", inherit = SimpleRelation, public = list(meta_data = NULL,
    nRows = NULL, data_dir = NULL, attributes = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$nRows = 0
        self$data_dir = ""
        self$meta_data = list()
        self$attributes = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$nRows = json$nRows
        self$data_dir = json$data_dir
        self$meta_data = lapply(json$meta_data, createObjectFromJson)
        self$attributes = lapply(json$attributes, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("TableRelation")
        m$meta_data = lapply(self$meta_data, function(each) each$toTson())
        m$nRows = tson.int(self$nRows)
        m$data_dir = tson.scalar(self$data_dir)
        m$attributes = lapply(self$attributes, function(each) each$toTson())
        return(m)
    }))
