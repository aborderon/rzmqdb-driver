#' Used for validate the fields structures of JSON
#'
#' @param obj The object to check
#' @param fieldname The field name to try validate
#' @param required The value of field is required or not
#' @param fieldtype The value of field must be this type
#' @param enum The enum list who value of field must be find
#' @param nullpropertie This value of field must be null or not
validators.properties <- function(obj, fieldname, required = FALSE, fieldtype = NULL, enum = NULL, nullpropertie = FALSE){
  # Error if fieldname is not found
  if(is.na(names(obj[fieldname]))){
    stop(paste("fieldname ",fieldname," is not found"), call. = FALSE)
  }
  if(!nullpropertie){
    # Error if value of fieldname is required but is null
    if(required && is.null(obj[[fieldname]])){
      stop(paste("fieldname ",fieldname," is null however it should be required"), call. = FALSE)
    }
    # Try to test if value of fieldname is not na or null
    if(!is.null(obj[[fieldname]])){
      # Try to test if type of field is not null
      if(!is.null(fieldtype)){
        # Error if value of fieldname is not type like fieldtype
        if(!fieldtype(obj[[fieldname]])){
          stop(paste("fieldname ",fieldname," is not type required : ",fieldtype), call. = FALSE)
        }
        # Try to test if enum is not null
        if(!is.null(enum)){
          data <- enum()
          if(is.null(names(data))){
            # Error if value of fieldname is not in enum
            if(!is.element(obj[[fieldname]],data)){
              stop(paste("Value of fieldname :",obj[[fieldname]]," is not in enum ",data), call. = FALSE)
            }
          }else{
            data <- names(data)
            # Error if value of fieldname is not in names of enum
            if(!is.element(obj[[fieldname]],data)){
              stop(paste("Value of fieldname :",obj[[fieldname]]," is not in enum ",data), call. = FALSE)
            }
          }
        }
      }
    }
  }else{
    if(!is.null(obj[[fieldname]])){
      stop(paste("This field have a value :",fieldname," however it should be NA"), call. = FALSE)
    }
  }
  return(obj[[fieldname]])
}

#' Used for validate if field is guid format
#'
#' @import stringr
#' @param string The character to check
#' @return Boolean
validators.is.guid <- function(string){
  return(str_detect(string, regex("^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$")))
}

#' Used for validate if field is positive numeric > 0
#'
#' @param num The numeric to check
#' @return Boolean
validators.is.numeric.positive <- function(num){
  if(is.numeric(num) && num > 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

#' Used for validate if field is positive numeric >= 0
#'
#' @param num The numeric to check
#' @return Boolean
validators.is.numeric.positive.or.zero <- function(num){
  if(is.numeric(num) && num >= 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

#' Used for validate if field is a vector of char OR a list
#'
#' @param x The value to check
#' @return Boolean
validators.is.char.or.empty.list <- function(x){
  if(is.character(x) || is.list(x)){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

#' ===================================
#' Can not use into function validator
#' ===================================

#' Used for validate if object is class R6 object
#'
#' @param obj The R6 object to check
#' @param class The name of R6 class to check
validators.is.R6 <- function(obj, class){
  if(!R6::is.R6(obj)){
    stop(paste("Object :",obj," is not an R6 object"), call. = FALSE)
  }

  if(class(obj)[1] != class$classname){
    # remplace good by class$classname
    stop(paste("Object :",obj," is not an 'good' class"), call. = FALSE)
  }
}

#' Empty Value, use when receved a list
#'
#' @param x an object to check its emptiness
#' @examples \dontrun{
#' validators.is.empty(NULL)     # [1] TRUE
#' validators.is.empty(list())     # [1] TRUE
#' validators.is.empty(NA)       # [1] TRUE
#' }
validators.is.empty <- function(x) {
  if (is.null(x))
    return (TRUE)
  if (length(x) == 0)
    return (TRUE)
  if (anyNA(x))
    return (TRUE)
  return (FALSE)
}
