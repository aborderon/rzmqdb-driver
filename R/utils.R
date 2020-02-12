#' Load R configuration
#'
#' @import config
configuration <- function(){
  config_file <- paste0(system.file("", package = "rzmqdb.driver"), "/config.yml")
  return(config <- config::get(file = config_file))
}
