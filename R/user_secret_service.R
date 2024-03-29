#' UserSecretService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#' }
#' 
UserSecretService <- R6::R6Class("UserSecretService", inherit = HttpClientService,
    public = list(initialize = function(baseRestUri, client) {
        super$initialize(baseRestUri, client)
        self$uri = "api/v1/userSecret"
    }, findSecretByUserId = function(keys = NULL, useFactory = FALSE) {
        return(self$findKeys("secret", keys = keys, useFactory = useFactory))
    }))
