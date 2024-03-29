#' RunProfile
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{Profile}}.
#' @field name of type String inherited from super class \code{\link{Profile}}.
#' @field memory of type int.
#' @field kernelMemory of type int.
#' @field blkioWeight of type int.
#' @field pidsLimit of type int.
#' @field ulimits_nofile of type int.
#' @field timeout of type int.
#' @field storageSize of type String.
#' @field cpusetCpus of type String.
RunProfile <- R6::R6Class("RunProfile", inherit = Profile, public = list(memory = NULL,
    kernelMemory = NULL, blkioWeight = NULL, pidsLimit = NULL, ulimits_nofile = NULL,
    timeout = NULL, storageSize = NULL, cpusetCpus = NULL, initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$memory = 0
        self$kernelMemory = 0
        self$blkioWeight = 0
        self$pidsLimit = 0
        self$ulimits_nofile = 0
        self$timeout = 0
        self$storageSize = ""
        self$cpusetCpus = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$memory = json$memory
        self$kernelMemory = json$kernelMemory
        self$blkioWeight = json$blkioWeight
        self$pidsLimit = json$pidsLimit
        self$ulimits_nofile = json$ulimits_nofile
        self$timeout = json$timeout
        self$storageSize = json$storageSize
        self$cpusetCpus = json$cpusetCpus
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("RunProfile")
        m$memory = tson.int(self$memory)
        m$kernelMemory = tson.int(self$kernelMemory)
        m$blkioWeight = tson.int(self$blkioWeight)
        m$pidsLimit = tson.int(self$pidsLimit)
        m$ulimits_nofile = tson.int(self$ulimits_nofile)
        m$timeout = tson.int(self$timeout)
        m$storageSize = tson.scalar(self$storageSize)
        m$cpusetCpus = tson.scalar(self$cpusetCpus)
        return(m)
    }))
