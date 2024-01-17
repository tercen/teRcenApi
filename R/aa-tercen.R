library(R6)
library(teRcenHttp)
library(yaml)


#' Tercen API for R
#'
#' Access Tercen at \url{http://tercen.com}
#'
#' @name tercenApi-package
#' @aliases tercenApi
#' @docType package
#' @import R6 teRcenHttp yaml
NULL

unbox <- function(object) {
    return(tson.scalar(object))
}

#' Base
#'
#' @export
Base <- R6::R6Class("Base", portable = TRUE, public = list(subKind = NULL, initialize = function(json = NULL) {
    if (!is.null(json)) {
        self$initJson(json)
    } else {
        self$init()
    }
}, init = function() {
}, initJson = function(json) {
    self$subKind = json$subKind
}, toTson = function() {
    return(list())
}, print = function(...) {
    cat(yaml::as.yaml(self$toTson()))
    invisible(self)
}))


#' MultiPart
#'
#' @export
MultiPart <- R6::R6Class("MultiPart", public = list(headers = structure(list(), names = character(0)),
    content = NULL, initialize = function(headers, content = NULL) {
        if (is.null(content)) stop("MultiPart : content is required")
        if (is.null(headers)) stop("MultiPart : headers is required")
        self$headers = headers
        self$content = content
    }, toTson = function() {
        list(headers = self$headers, content = self$content)
    }))

#' HttpClientService
#'
#' @export
HttpClientService <- R6::R6Class("HttpClientService", public = list(client = NULL,
    baseRestUri = NULL, uri = NULL, initialize = function(baseRestUri, client) {
        if (endsWith(baseRestUri, "/")) {
            self$baseRestUri = baseRestUri
        } else {
            self$baseRestUri = paste0(baseRestUri, "/")
        }
        self$client = client
    }, onResponseError = function(response, msg = "") {
        body = response$content
        stop(paste0("Failed : ", msg, " : status=", response$status, " body=", toString(body)))

    }, toTson = function(object) {
        return(object$toTson())
    }, fromTson = function(object) {
        return(createObjectFromJson(object))
    }, getServiceUri = function(uri, ...) {
        return(paste0(self$baseRestUri, uri, ...))
    }, create = function(object) {
        url = self$getServiceUri(self$uri)
        body = self$toTson(object)
        response = self$client$put(url, body = body)
        if (response$status != 200) {
            self$onResponseError(response, "create")
        }
        self$fromTson(response$content)
    }, get = function(id, useFactory = TRUE) {
        url = self$getServiceUri(self$uri)
        response = self$client$get(url, query = list(id = id, useFactory = tolower(toString(useFactory))))
        if (response$status != 200) {
            self$onResponseError(response, "get")
        }
        self$fromTson(response$content)
    }, delete = function(id, rev) {
        url = self$getServiceUri(self$uri)
        response = self$client$delete(url, query = list(id = id, rev = rev))
        if (response$status != 200) {
            self$onResponseError(response, "delete")
        }
    }, update = function(object) {
        url = self$getServiceUri(self$uri)
        body = self$toTson(object)
        response = self$client$post(url, body = body)
        if (response$status != 200) {
            self$onResponseError(response, "update")
        }
        object$rev = response$content[[1]]
        return(object$rev)
    }, list = function(ids, useFactory = TRUE) {
        url = self$getServiceUri(self$uri, "/list")
        body = body = lapply(ids, tson.scalar)
        response = self$client$post(url, body = body, query = list(useFactory = tolower(toString(useFactory))))
        if (response$status != 200) {
            self$onResponseError(response, "list")
        }
        list = response$content
        lapply(list, function(each) self$fromTson(each))
    }, findStartKeys = function(viewName, startKey = NULL, endKey = NULL, limit = 20,
        skip = 0, descending = TRUE, useFactory = FALSE) {
        url = self$getServiceUri(self$uri, "/", viewName)
        if (is.list(startKey)) {
            startKey = lapply(startKey, unbox)
        } else {
            startKey = unbox(startKey)
        }

        if (is.list(endKey)) {
            endKey = lapply(endKey, unbox)
        } else {
            endKey = unbox(endKey)
        }

        body = list(startKey = startKey, endKey = endKey, limit = tson.int(limit),
            skip = tson.int(skip), descending = unbox(descending))
        response = self$client$post(url, body = body, query = list(useFactory = tolower(toString(useFactory))))
        if (response$status != 200) {
            self$onResponseError(response, "findStartKeys")
        }
        list = response$content
        lapply(list, function(each) self$fromTson(each))
    }, findKeys = function(viewName, keys = NULL, useFactory = FALSE) {
        url = self$getServiceUri(self$uri, "/", viewName)
        body = lapply(keys, unbox)
        response = self$client$post(url, body = body, query = list(useFactory = tolower(toString(useFactory))))
        if (response$status != 200) {
            self$onResponseError(response, "findKeys")
        }
        list = response$content
        lapply(list, function(each) self$fromTson(each))
    }))
