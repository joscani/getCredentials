#' Get  S3 credentidal from aws ec2
#'
#' This function get S3 credentials when you are in a ec2 instance
#'
#'
#'
#'
#' @param rolename string
#' @return Send enviroment variabls
#' @export
getCredentials <- function(rolename = NULL) {
  if (is.null(rolename)) {
    tmp <- metadata$iam_role_names()

  } else {
    tmp <- rolename

  }
  info <- metadata$iam_role(tmp)
  return(
    Sys.setenv(
      "AWS_ACCESS_KEY_ID" = info$AccessKeyId,
      "AWS_SECRET_ACCESS_KEY" = info$SecretAccessKey,
      "AWS_DEFAULT_REGION" = "eu-west-1",
      "AWS_SESSION_TOKEN" = info$Token
    )
  )
}
