#' TaskService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{runTask(taskId)}}{method}
#'    \item{\code{cancelTask(taskId)}}{method}
#'    \item{\code{waitDone(taskId)}}{method}
#'    \item{\code{updateWorker(worker)}}{method}
#'    \item{\code{taskDurationByTeam(teamId,year,month)}}{method}
#'    \item{\code{getWorkers(names)}}{method}
#'    \item{\code{getTasks(names)}}{method}
#'    \item{\code{setTaskEnvironment(taskId,environment)}}{method}
#'    \item{\code{collectTaskStats(taskId)}}{method}
#' }
#' 
TaskService <- R6::R6Class("TaskService", inherit = HttpClientService, public = list(initialize = function(baseRestUri,
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/task"
}, findByHash = function(startKey = NULL, endKey = NULL, limit = 20, skip = 0, descending = TRUE,
    useFactory = FALSE) {
    return(self$findStartKeys("findByHash", startKey = startKey, endKey = endKey,
        limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findGCTaskByLastModifiedDate = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findGCTaskByLastModifiedDate", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, runTask = function(taskId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "runTask")
    params = list()
    params[["taskId"]] = unbox(taskId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "runTask")
    } else {
        answer = NULL
    }
    return(answer)
}, cancelTask = function(taskId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "cancelTask")
    params = list()
    params[["taskId"]] = unbox(taskId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "cancelTask")
    } else {
        answer = NULL
    }
    return(answer)
}, waitDone = function(taskId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "waitDone")
    params = list()
    params[["taskId"]] = unbox(taskId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "waitDone")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, updateWorker = function(worker) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "updateWorker")
    params = list()
    params[["worker"]] = worker$toTson()
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "updateWorker")
    } else {
        answer = NULL
    }
    return(answer)
}, taskDurationByTeam = function(teamId, year, month) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "taskDurationByTeam")
    params = list()
    params[["teamId"]] = unbox(teamId)
    params[["year"]] = unbox(as.integer(year))
    params[["month"]] = unbox(as.integer(month))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "taskDurationByTeam")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, getWorkers = function(names) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "getWorkers")
    params = list()
    params[["names"]] = lapply(names, unbox)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getWorkers")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getTasks = function(names) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "getTasks")
    params = list()
    params[["names"]] = lapply(names, unbox)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getTasks")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, setTaskEnvironment = function(taskId, environment) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "setTaskEnvironment")
    params = list()
    params[["taskId"]] = unbox(taskId)
    params[["environment"]] = lapply(environment, function(each) each$toTson())
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "setTaskEnvironment")
    } else {
        answer = NULL
    }
    return(answer)
}, collectTaskStats = function(taskId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/task", "/", "collectTaskStats")
    params = list()
    params[["taskId"]] = unbox(taskId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "collectTaskStats")
    } else {
        answer = NULL
    }
    return(answer)
}))
