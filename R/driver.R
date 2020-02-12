#' Select value
#'
#' @export
#' @param environmentId The environnement who contains informations of one document
#' @param document The document who contains informations of multiple values
#' @param key The key of one value
select <- function(environmentId,document,key) {

  storage <- Storage$new()

  # return data
  return(storage$select(environmentId,document,key))
}

#' Insert value
#'
#' @export
#' @param environmentId The environnement who contains informations of one document
#' @param document The document who contains informations of multiple values
#' @param key The key of one value
#' @param value The value to insert
insert <- function(environmentId,document,key,value) {

  storage <- Storage$new()

  # return data
  return(storage$insert(environmentId,document,key,value))
}
