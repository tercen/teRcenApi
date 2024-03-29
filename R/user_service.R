#' UserService
#'
#' @export
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'    \item{\code{getSamlMessage(type)}}{method}
#'    \item{\code{cookieConsent(dummy)}}{method}
#'    \item{\code{connect(usernameOrEmail,password)}}{method}
#'    \item{\code{connect2(domain,usernameOrEmail,password)}}{method}
#'    \item{\code{createUser(user,password)}}{method}
#'    \item{\code{hasUserName(username)}}{method}
#'    \item{\code{updatePassword(userId,password)}}{method}
#'    \item{\code{updateBillingInfo(userId,billingInfo)}}{method}
#'    \item{\code{viesInfo(country_code,vatNumber)}}{method}
#'    \item{\code{summary(userId)}}{method}
#'    \item{\code{resourceSummary(userId)}}{method}
#'    \item{\code{profiles(userId)}}{method}
#'    \item{\code{createToken(userId,validityInSeconds)}}{method}
#'    \item{\code{createTokenForTask(userId,validityInSeconds,taskId)}}{method}
#'    \item{\code{isTokenValid(token)}}{method}
#'    \item{\code{setTeamPrivilege(username,principal,privilege)}}{method}
#'    \item{\code{getServerVersion(module)}}{method}
#'    \item{\code{getClientConfig(keys)}}{method}
#'    \item{\code{getInvited(email)}}{method}
#'    \item{\code{sendValidationMail(email)}}{method}
#'    \item{\code{sendResetPasswordEmail(email)}}{method}
#'    \item{\code{changeUserPassword(token,password)}}{method}
#'    \item{\code{validateUser(token)}}{method}
#'    \item{\code{canCreatePrivateProject(teamOrUserId)}}{method}
#' }
#' 
UserService <- R6::R6Class("UserService", inherit = HttpClientService, public = list(initialize = function(baseRestUri,
    client) {
    super$initialize(baseRestUri, client)
    self$uri = "api/v1/user"
}, findTeamMembers = function(keys = NULL, useFactory = FALSE) {
    return(self$findKeys("teamMembers", keys = keys, useFactory = useFactory))
}, findUserByCreatedDateAndName = function(startKey = NULL, endKey = NULL, limit = 20,
    skip = 0, descending = TRUE, useFactory = FALSE) {
    return(self$findStartKeys("findUserByCreatedDateAndName", startKey = startKey,
        endKey = endKey, limit = limit, skip = skip, descending = descending, useFactory = useFactory))
}, findUserByEmail = function(keys = NULL, useFactory = FALSE) {
    return(self$findKeys("userByEmail", keys = keys, useFactory = useFactory))
}, getSamlMessage = function(type) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "getSamlMessage")
    params = list()
    params[["type"]] = unbox(type)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getSamlMessage")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, cookieConsent = function(dummy) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "cookieConsent")
    params = list()
    params[["dummy"]] = unbox(dummy)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "cookieConsent")
    } else {
        answer = NULL
    }
    return(answer)
}, connect = function(usernameOrEmail, password) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "connect")
    params = list()
    params[["usernameOrEmail"]] = unbox(usernameOrEmail)
    params[["password"]] = unbox(password)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "connect")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, connect2 = function(domain, usernameOrEmail, password) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "connect2")
    params = list()
    params[["domain"]] = unbox(domain)
    params[["usernameOrEmail"]] = unbox(usernameOrEmail)
    params[["password"]] = unbox(password)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "connect2")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, createUser = function(user, password) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "createUser")
    params = list()
    params[["user"]] = user$toTson()
    params[["password"]] = unbox(password)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "createUser")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, hasUserName = function(username) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "hasUserName")
    params = list()
    params[["username"]] = unbox(username)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "hasUserName")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, updatePassword = function(userId, password) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "updatePassword")
    params = list()
    params[["userId"]] = unbox(userId)
    params[["password"]] = unbox(password)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "updatePassword")
    } else {
        answer = NULL
    }
    return(answer)
}, updateBillingInfo = function(userId, billingInfo) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "updateBillingInfo")
    params = list()
    params[["userId"]] = unbox(userId)
    params[["billingInfo"]] = billingInfo$toTson()
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "updateBillingInfo")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, viesInfo = function(country_code, vatNumber) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "viesInfo")
    params = list()
    params[["country_code"]] = unbox(country_code)
    params[["vatNumber"]] = unbox(vatNumber)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "viesInfo")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, summary = function(userId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "summary")
    params = list()
    params[["userId"]] = unbox(userId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "summary")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, resourceSummary = function(userId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "resourceSummary")
    params = list()
    params[["userId"]] = unbox(userId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "resourceSummary")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, profiles = function(userId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "profiles")
    params = list()
    params[["userId"]] = unbox(userId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "profiles")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, createToken = function(userId, validityInSeconds) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "createToken")
    params = list()
    params[["userId"]] = unbox(userId)
    params[["validityInSeconds"]] = unbox(as.integer(validityInSeconds))
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "createToken")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, createTokenForTask = function(userId, validityInSeconds, taskId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "createTokenForTask")
    params = list()
    params[["userId"]] = unbox(userId)
    params[["validityInSeconds"]] = unbox(as.integer(validityInSeconds))
    params[["taskId"]] = unbox(taskId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "createTokenForTask")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, isTokenValid = function(token) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "isTokenValid")
    params = list()
    params[["token"]] = unbox(token)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "isTokenValid")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, setTeamPrivilege = function(username, principal, privilege) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "setTeamPrivilege")
    params = list()
    params[["username"]] = unbox(username)
    params[["principal"]] = principal$toTson()
    params[["privilege"]] = privilege$toTson()
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "setTeamPrivilege")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}, getServerVersion = function(module) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "getServerVersion")
    params = list()
    params[["module"]] = unbox(module)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getServerVersion")
    } else {
        answer = createObjectFromJson(response$content)
    }
    return(answer)
}, getClientConfig = function(keys) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "getClientConfig")
    params = list()
    params[["keys"]] = lapply(keys, unbox)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getClientConfig")
    } else {
        answer = lapply(response$content, createObjectFromJson)
    }
    return(answer)
}, getInvited = function(email) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "getInvited")
    params = list()
    params[["email"]] = unbox(email)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "getInvited")
    } else {
        answer = NULL
    }
    return(answer)
}, sendValidationMail = function(email) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "sendValidationMail")
    params = list()
    params[["email"]] = unbox(email)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "sendValidationMail")
    } else {
        answer = NULL
    }
    return(answer)
}, sendResetPasswordEmail = function(email) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "sendResetPasswordEmail")
    params = list()
    params[["email"]] = unbox(email)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "sendResetPasswordEmail")
    } else {
        answer = NULL
    }
    return(answer)
}, changeUserPassword = function(token, password) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "changeUserPassword")
    params = list()
    params[["token"]] = unbox(token)
    params[["password"]] = unbox(password)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "changeUserPassword")
    } else {
        answer = NULL
    }
    return(answer)
}, validateUser = function(token) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "validateUser")
    params = list()
    params[["token"]] = unbox(token)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "validateUser")
    } else {
        answer = NULL
    }
    return(answer)
}, canCreatePrivateProject = function(teamOrUserId) {
    answer = NULL
    response = NULL
    uri = paste0("api/v1/user", "/", "canCreatePrivateProject")
    params = list()
    params[["teamOrUserId"]] = unbox(teamOrUserId)
    url = self$getServiceUri(uri)
    response = self$client$post(url, body = params)
    if (response$status != 200) {
        self$onResponseError(response, "canCreatePrivateProject")
    } else {
        answer = response$content[[1]]
    }
    return(answer)
}))
