#' PatchRecords
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Event}}.
#' @field isDeleted of type bool inherited from super class \code{\link{PersistentObject}}.
#' @field rev of type String inherited from super class \code{\link{PersistentObject}}.
#' @field id of type String inherited from super class \code{\link{IdObject}}.
#' @field u of type String.
#' @field cI of type String.
#' @field oI of type String.
#' @field oR of type String.
#' @field oK of type String.
#' @field s of type int.
#' @field date object of class \code{\link{Date}} inherited from super class \code{\link{Event}}.
#' @field rs list of class \code{\link{PatchRecord}}.
PatchRecords <- R6::R6Class("PatchRecords", inherit = Event, public = list(u = NULL,
    cI = NULL, oI = NULL, oR = NULL, oK = NULL, s = NULL, rs = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$u = ""
        self$cI = ""
        self$oI = ""
        self$oR = ""
        self$oK = ""
        self$s = 0
        self$rs = list()
    }, initJson = function(json) {
        super$initJson(json)
        self$u = json$u
        self$cI = json$cI
        self$oI = json$oI
        self$oR = json$oR
        self$oK = json$oK
        self$s = json$s
        self$rs = lapply(json$rs, createObjectFromJson)
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("PatchRecords")
        m$u = tson.scalar(self$u)
        m$cI = tson.scalar(self$cI)
        m$oI = tson.scalar(self$oI)
        m$oR = tson.scalar(self$oR)
        m$oK = tson.scalar(self$oK)
        m$s = tson.int(self$s)
        m$rs = lapply(self$rs, function(each) each$toTson())
        return(m)
    }))
