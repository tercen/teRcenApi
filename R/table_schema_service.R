#' TableSchemaService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{findByQueryHash(ids)}}{method}
#'    \item{\code{select(tableId,cnames,offset,limit)}}{method}
#'    \item{\code{selectPairwise(tableId,cnames,offset,limit)}}{method}
#'    \item{\code{selectStream(tableId,cnames,offset,limit)}}{method}
#'    \item{\code{selectFileContentStream(tableId,filename)}}{method}
#'    \item{\code{selectCSV(tableId,cnames,offset,limit,separator,quote,encoding)}}{method}
#' }
#' 
TableSchemaService <- R6::R6Class("TableSchemaService", inherit = HttpClientService,
    public = list(initialize = function(baseRestUri, client) {
        super$initialize(baseRestUri, client)
        self$uri = "api/v1/schema"
    }, findSchemaByDataDirectory = function(startKey = NULL, endKey = NULL, limit = 20,
        skip = 0, descending = TRUE, useFactory = FALSE) {
        return(self$findStartKeys("findSchemaByDataDirectory", startKey = startKey,
            endKey = endKey, limit = limit, skip = skip, descending = descending,
            useFactory = useFactory))
    }, findByQueryHash = function(ids) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/schema", "/", "findByQueryHash")
        params = list()
        params[["ids"]] = lapply(ids, unbox)
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "findByQueryHash")
        } else {
            answer = lapply(response$content, createObjectFromJson)
        }
        return(answer)
    }, select = function(tableId, cnames, offset, limit) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/schema", "/", "select")
        params = list()
        params[["tableId"]] = unbox(tableId)
        params[["cnames"]] = lapply(cnames, unbox)
        params[["offset"]] = unbox(as.integer(offset))
        params[["limit"]] = unbox(as.integer(limit))
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "select")
        } else {
            answer = createObjectFromJson(response$content)
        }
        return(answer)
    }, selectPairwise = function(tableId, cnames, offset, limit) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/schema", "/", "selectPairwise")
        params = list()
        params[["tableId"]] = unbox(tableId)
        params[["cnames"]] = lapply(cnames, unbox)
        params[["offset"]] = unbox(as.integer(offset))
        params[["limit"]] = unbox(as.integer(limit))
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "selectPairwise")
        } else {
            answer = createObjectFromJson(response$content)
        }
        return(answer)
    }, selectStream = function(tableId, cnames, offset, limit) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/schema", "/", "selectStream")
        params = list()
        params[["tableId"]] = unbox(tableId)
        params[["cnames"]] = lapply(cnames, unbox)
        params[["offset"]] = unbox(as.integer(offset))
        params[["limit"]] = unbox(as.integer(limit))
        url = self$getServiceUri(uri)
        response = self$client$post(url, body = params)
        if (response$status != 200) {
            self$onResponseError(response, "selectStream")
        } else {
            answer = response$content
        }
        return(answer)
    }, selectFileContentStream = function(tableId, filename) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/schema", "/", "selectFileContentStream")
        params = list()
        params[["tableId"]] = unbox(tableId)
        params[["filename"]] = unbox(filename)
        url = self$getServiceUri(uri)
        response = self$client$get(url, query = list(params = toJSON(params)))
        if (response$status != 200) {
            self$onResponseError(response, "selectFileContentStream")
        } else {
            answer = response$content
        }
        return(answer)
    }, selectCSV = function(tableId, cnames, offset, limit, separator, quote, encoding) {
        answer = NULL
        response = NULL
        uri = paste0("api/v1/schema", "/", "selectCSV")
        params = list()
        params[["tableId"]] = unbox(tableId)
        params[["cnames"]] = lapply(cnames, unbox)
        params[["offset"]] = unbox(as.integer(offset))
        params[["limit"]] = unbox(as.integer(limit))
        params[["separator"]] = unbox(separator)
        params[["quote"]] = unbox(quote)
        params[["encoding"]] = unbox(encoding)
        url = self$getServiceUri(uri)
        response = self$client$get(url, query = list(params = toJSON(params)))
        if (response$status != 200) {
            self$onResponseError(response, "selectCSV")
        } else {
            answer = response$content
        }
        return(answer)
    }))
