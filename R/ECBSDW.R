# Header ------------------------------------------------------------------
#
# Title: R code for downloading time-series from the ECB Statistical Data Warehouse
#
# Author: Graeme Walsh <graeme.walsh@hotmail.co.uk>
# Date: 19/08/2018


# Package Info ------------------------------------------------------------

#' A package for downloading time-series from the ECB Statistical Data Warehouse.
#'
#' The workhorse function of the package is \code{getECBSDW()}. This function returns a
#' dataframe containing the requested time-series. The code behind this package also serves as a backend
#' to an EViews add-in created by the author.
#'
#'
#' @section ECBSDW functions:
#' \code{getECBSDW()}
#'
#' @docType package
#' @name ECBSDW
NULL


# Important variables -----------------------------------------------------

# New environment
ECBSDW.env <- new.env()

# ECB SDW URL for pivot style csv download
ECBSDW.env$base_url <- "http://sdw-wsrest.ecb.europa.eu/service/data/"

# Query string for the data format
ECBSDW.env$format_query <- "?format=csvdata"


# Read data functions -----------------------------------------------------

#' @title Get a time-series from the ECB SDW
#' @description Downloads a time-series from ECB SDW into R
#' @param series_key The series key for the time-series to be downloaded
#' @importFrom utils read.csv
#' @export
#' @author Graeme Walsh
#' @details This function uses a very simple interface with the ECB SDW and does not use the ECB SDW API, unlike some other R packages.

getECBSDW <- function(series_key){

  # Tidy the series key for the request (format is "dataset/other.stuff.here" not "dataset.other.stuff.here")
  series_key <- sub(".", "/", series_key, fixed = TRUE)

  # Read the .csv file into R as a dataframe
  data <- read.csv(paste0(ECBSDW.env$base_url, series_key, ECBSDW.env$format_query), header = TRUE, check.names = FALSE, na.strings = "", stringsAsFactors = FALSE)

  return(data)
}
