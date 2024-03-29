#' Lock
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{PersistentObject}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field name of type String.
Lock <- R6::R6Class("Lock", inherit = PersistentObject, public = list(name = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$name = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$name = json$name
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Lock")
        m$name = tson.scalar(self$name)
        return(m)
    }))
