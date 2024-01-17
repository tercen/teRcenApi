#' Ace
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}.
#' @field principals list of class \code{\link{Principal}}.
#' @field privileges list of class \code{\link{Privilege}}.
Ace <- R6::R6Class("Ace", inherit = SciObject, public = list(principals = NULL, privileges = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$principals = list()
        self$privileges = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$principals = lapply(json$principals, createObjectFromJson)
        self$privileges = lapply(json$privileges, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Ace")
        m$principals = lapply(self$principals, function(each) each$toTson())
        m$privileges = lapply(self$privileges, function(each) each$toTson())
        return(m)
    }))
