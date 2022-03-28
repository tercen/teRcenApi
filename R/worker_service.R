#' WorkerService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{exec(task)}}{method}
#'    \item{\code{setPriority(priority)}}{method}
#'    \item{\code{setStatus(status)}}{method}
#'    \item{\code{setHeartBeat(heartBeat)}}{method}
#'    \item{\code{getState(all)}}{method}
#'    \item{\code{updateTaskEnv(taskId,env)}}{method}
#'    \item{\code{getTaskEnv(taskId)}}{method}
#' }
#' 
WorkerService <- R6::R6Class("WorkerService", inherit = HttpClientService, public = list(initialize = function(baseRestUri, 
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/worker"
}, exec = function(task) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "exec")
    params = list()
    params[["task"]] = task$toTson()
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "exec")
    } else {
        answer = NULL
    }
    return(answer)
}, setPriority = function(priority) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "setPriority")
    params = list()
    params[["priority"]] = unbox(priority)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "setPriority")
    } else {
        answer = NULL
    }
    return(answer)
}, setStatus = function(status) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "setStatus")
    params = list()
    params[["status"]] = unbox(status)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "setStatus")
    } else {
        answer = NULL
    }
    return(answer)
}, setHeartBeat = function(heartBeat) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "setHeartBeat")
    params = list()
    params[["heartBeat"]] = unbox(as.integer(heartBeat))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "setHeartBeat")
    } else {
        answer = NULL
    }
    return(answer)
}, getState = function(all) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "getState")
    params = list()
    params[["all"]] = unbox(all)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getState")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, updateTaskEnv = function(taskId, env) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "updateTaskEnv")
    params = list()
    params[["taskId"]] = unbox(taskId)
    params[["env"]] = lapply(env, function(each) each$toTson())
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "updateTaskEnv")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTaskEnv = function(taskId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/worker", "/", "getTaskEnv")
    params = list()
    params[["taskId"]] = unbox(taskId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTaskEnv")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}))
