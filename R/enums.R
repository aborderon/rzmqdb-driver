#' Dimension enum with hierarchies
#'
#' @return Character list
dimension.enum <- function() {
  return(list(
    "DOCUMENT" = list(
      "DOC_TYPE"
    ),
    "TEMPORAL" = list(
      "DAY", "WEEK", "MONTH", "YEAR"
    ),
    "COMPANY" = list(
      "COMPANY_CODE"
    ),
    "POINT_SALE" = list(
      "POINT_SALE_CODE"
    ),
    "CUSTOMER" = list(
      "CUSTOMER_CODE", "CUSTOMER_BUSINESS_NAME", "CUSTOMER_GROUP_CODE", "CUSTOMER_GROUP_BUSINESS_NAME"
    ),
    "ADDRESS" = list(
      "CITY", "DEPARTMENT", "COUNTRY"
    ),
    "ITEM" = list(
      "ITEM_CODE", "ITEM_DESIGNATION"
    ),
    "PRODUCT_LINE" = list(
      "PRODUCT_LINE_CODE", "PRODUCT_LINE_DESIGNATION"
    ),
    "STAT_CUSTOMER_FAMILY_1" = list(
      "STAT_CUSTOMER_FAMILY_CODE_1", "STAT_CUSTOMER_FAMILY_1_DESIGNATION"
    ),
    "STAT_CUSTOMER_FAMILY_2" = list(
      "STAT_CUSTOMER_FAMILY_CODE_2", "STAT_CUSTOMER_FAMILY_2_DESIGNATION"
    ),
    "STAT_CUSTOMER_FAMILY_3" = list(
      "STAT_CUSTOMER_FAMILY_CODE_3", "STAT_CUSTOMER_FAMILY_3_DESIGNATION"
    ),
    "STAT_CUSTOMER_FAMILY_4" = list(
      "STAT_CUSTOMER_FAMILY_CODE_4", "STAT_CUSTOMER_FAMILY_4_DESIGNATION"
    ),
    "STAT_CUSTOMER_FAMILY_5" = list(
      "STAT_CUSTOMER_FAMILY_CODE_5", "STAT_CUSTOMER_FAMILY_5_DESIGNATION"
    ),
    "STAT_ITEM_FAMILY_1" = list(
      "STAT_ITEM_FAMILY_CODE_1", "STAT_ITEM_FAMILY_1_DESIGNATION"
    ),
    "STAT_ITEM_FAMILY_2" = list(
      "STAT_ITEM_FAMILY_CODE_2", "STAT_ITEM_FAMILY_2_DESIGNATION"
    ),
    "STAT_ITEM_FAMILY_3" = list(
      "STAT_ITEM_FAMILY_CODE_3", "STAT_ITEM_FAMILY_3_DESIGNATION"
    ),
    "STAT_ITEM_FAMILY_4" = list(
      "STAT_ITEM_FAMILY_CODE_4", "STAT_ITEM_FAMILY_4_DESIGNATION"
    ),
    "STAT_ITEM_FAMILY_5" = list(
      "STAT_ITEM_FAMILY_CODE_5", "STAT_ITEM_FAMILY_5_DESIGNATION"
    )
  ))
}

#' Hierarchy enum
#'
#' @return Character list
hierarchy.enum <- function() {
  return(list(
    "DOC_TYPE",
    "DAY", "WEEK", "MONTH", "YEAR",
    "COMPANY_CODE",
    "POINT_SALE_CODE",
    "CUSTOMER_CODE", "CUSTOMER_BUSINESS_NAME", "CUSTOMER_GROUP_CODE", "CUSTOMER_GROUP_BUSINESS_NAME",
    "CITY", "DEPARTMENT", "COUNTRY",
    "ITEM_CODE", "ITEM_DESIGNATION",
    "PRODUCT_LINE_CODE", "PRODUCT_LINE_DESIGNATION",
    "STAT_CUSTOMER_FAMILY_CODE_1", "STAT_CUSTOMER_FAMILY_1_DESIGNATION",
    "STAT_CUSTOMER_FAMILY_CODE_2", "STAT_CUSTOMER_FAMILY_2_DESIGNATION",
    "STAT_CUSTOMER_FAMILY_CODE_3", "STAT_CUSTOMER_FAMILY_3_DESIGNATION",
    "STAT_CUSTOMER_FAMILY_CODE_4", "STAT_CUSTOMER_FAMILY_4_DESIGNATION",
    "STAT_CUSTOMER_FAMILY_CODE_5", "STAT_CUSTOMER_FAMILY_5_DESIGNATION",
    "STAT_ITEM_FAMILY_CODE_1", "STAT_ITEM_FAMILY_1_DESIGNATION",
    "STAT_ITEM_FAMILY_CODE_2", "STAT_ITEM_FAMILY_2_DESIGNATION",
    "STAT_ITEM_FAMILY_CODE_3", "STAT_ITEM_FAMILY_3_DESIGNATION",
    "STAT_ITEM_FAMILY_CODE_4", "STAT_ITEM_FAMILY_4_DESIGNATION",
    "STAT_ITEM_FAMILY_CODE_5", "STAT_ITEM_FAMILY_5_DESIGNATION"
  ))
}

#' Measure enum with function
#'
#' @return Character list
measure.enum <- function() {
  return(list(
    "QUANTITY" = list(
      "SUM", "MIN", "MAX", "MEAN", "MEDIAN"
    ),
    "UNIT_PRICE" = list(
      "SUM", "MIN", "MAX", "MEAN", "MEDIAN"
    ),
    "UNIT_MARGIN" = list(
      "SUM", "MIN", "MAX", "MEAN", "MEDIAN"
    ),
    "UNIT_WEIGHT" = list(
      "SUM", "MIN", "MAX", "MEAN", "MEDIAN"
    ),
    "AMOUNT" = list(
      "SUM", "MIN", "MAX", "MEAN", "MEDIAN"
    ),
    "QUANTITY_UNIT_STOCK" = list(
      "SUM", "MIN", "MAX", "MEAN", "MEDIAN"
    )
  ))
}

#' Function enum with mathematics functions
#'
#' @param type The function enum name
#' @return Character list
function.enum <- function(type) {

  functions <- list(
    "SUM" = base::sum,
    "MIN" = base::min,
    "MAX" = base::max,
    "MEAN" = base::mean,
    "MEDIAN" = stats::median
  )

  if(is.null(functions[[type]])){
    stop("Error, mathematic function is not found")
  }

  return(functions[[type]])
}

#' Sector enum
#'
#' @return Character list
sector.enum <- function() {
  return(list("BUSINESS"))
}

#' Document enum
#'
#' @return Character list
document.enum <- function() {
  return(list("INVOICE","ORDER","QUOTE","CUSTOMER"))
}

#' Connector enum
#'
#' @return Character list
connector.enum <- function() {
  return(list("SAGE_X3_ORACLE"))
}
