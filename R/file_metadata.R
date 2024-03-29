#' FileMetadata
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{CSVFileMetadata}}.
#' @field contentType of type String.
#' @field cacheControl of type String.
#' @field contentEncoding of type String.
#' @field contentLanguage of type String.
#' @field md5Hash of type String.
FileMetadata <- R6::R6Class("FileMetadata", inherit = SciObject, public = list(contentType = NULL,
    cacheControl = NULL, contentEncoding = NULL, contentLanguage = NULL, md5Hash = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$contentType = ""
        self$cacheControl = ""
        self$contentEncoding = ""
        self$contentLanguage = ""
        self$md5Hash = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$contentType = json$contentType
        self$cacheControl = json$cacheControl
        self$contentEncoding = json$contentEncoding
        self$contentLanguage = json$contentLanguage
        self$md5Hash = json$md5Hash
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("FileMetadata")
        m$contentType = tson.scalar(self$contentType)
        m$cacheControl = tson.scalar(self$cacheControl)
        m$contentEncoding = tson.scalar(self$contentEncoding)
        m$contentLanguage = tson.scalar(self$contentLanguage)
        m$md5Hash = tson.scalar(self$md5Hash)
        return(m)
    }))
