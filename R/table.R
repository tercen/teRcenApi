#' Table
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field nRows of type int.
#' @field properties object of class \code{\link{TableProperties}}.
#' @field columns list of class \code{\link{Column}}.
Table <- R6::R6Class("Table", inherit = SciObject, public = list(nRows = NULL, properties = NULL,
    columns = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$nRows = 0
        self$properties = TableProperties$new()
        self$columns = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$nRows = json$nRows
        self$properties = createObjectFromJson(json$properties)
        self$columns = lapply(json$columns, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Table")
        m$nRows = tson.int(self$nRows)
        if (!is.null(self$properties)) m$properties = self$properties$toTson()
        m$columns = lapply(self$columns, function(each) each$toTson())
        return(m)
    }))
