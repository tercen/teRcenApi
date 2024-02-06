#' Operator
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Document}}, sub classes \code{\link{ShinyOperator}}, \code{\link{DockerWebAppOperator}}, \code{\link{DockerOperator}}, \code{\link{ROperator}}, \code{\link{WebAppOperator}}, \code{\link{GitOperator}}.
#' @field description of type String inherited from super class \code{\link{Document}}.
#' @field name of type String inherited from super class \code{\link{Document}}.
#' @field tags list of type String inherited from super class \code{\link{Document}}.
#' @field version of type String inherited from super class \code{\link{Document}}.
#' @field isPublic of type bool inherited from super class \code{\link{Document}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field acl object of class \code{\link{Acl}} inherited from super class \code{\link{Document}}.
#' @field createdDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field lastModifiedDate object of class \code{\link{Date}} inherited from super class \code{\link{Document}}.
#' @field urls list of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field meta list of class \code{\link{Pair}} inherited from super class \code{\link{Document}}.
#' @field url object of class \code{\link{Url}} inherited from super class \code{\link{Document}}.
#' @field properties list of class \code{\link{Property}}.
#' @field operatorSpec object of class \code{\link{OperatorSpec}}.
Operator <- R6::R6Class("Operator", inherit = Document, public = list(properties = NULL,
    operatorSpec = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$properties = list()
        self$operatorSpec = OperatorSpec$new()
    }, initJson = function(json) {
        super$initJson(json)
        self$properties = lapply(json$properties, createObjectFromJson)
        self$operatorSpec = createObjectFromJson(json$operatorSpec)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("Operator")
        m$properties = lapply(self$properties, function(each) each$toTson())
        if (!is.null(self$operatorSpec)) m$operatorSpec = self$operatorSpec$toTson()
        return(m)
    }))
