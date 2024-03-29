#' TaxId
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field type of type String.
#' @field value of type String.
#' @field isValid of type bool.
TaxId <- R6::R6Class("TaxId", inherit = SciObject, public = list(type = NULL, value = NULL,
    isValid = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$type = ""
        self$value = ""
        self$isValid = TRUE
    }, initJson = function(json) {
        super$initJson(json)
        self$type = json$type
        self$value = json$value
        self$isValid = json$isValid
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("TaxId")
        m$type = tson.scalar(self$type)
        m$value = tson.scalar(self$value)
        m$isValid = tson.scalar(self$isValid)
        return(m)
    }))
