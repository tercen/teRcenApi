#' Port
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{IdObject}}, sub classes \code{\link{InputPort}}, \code{\link{OutputPort}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field linkType of type String.
#' @field name of type String.
Port <- R6::R6Class("Port", inherit = IdObject, public = list(linkType = NULL, name = NULL, 
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$linkType = ""
        self$name = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$linkType = json$linkType
        self$name = json$name
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Port")
        m$linkType = tson.scalar(self$linkType)
        m$name = tson.scalar(self$name)
        return(m)
    }))
