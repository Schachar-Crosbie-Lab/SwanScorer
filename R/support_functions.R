#required_libraries <- c('tidyverse', 'rio', 'janitor')

#### Load language ####
#### Declares language upload loading the package.
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("SwanScorer has been loaded")
}

#### Global Variables ####
#globalVariables(c("time","hr_bpm","datetime","time_bin","Name","bounds"))

#### clean_file function ####
#' @name read_clean_file
#'
#' @title Read and Clean File
#'
#' @description This function reads and cleans the uploaded SWAN scores file
#'
#' @param file_path Should be a path on your computer to the SWAN scores
#'
#' @importFrom rio import
#' @importFrom rio get_ext
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr filter
#'
#' @returns A clean data frame ready for t-scores
#'
#' @section Notes for development:
#'
#'
clean_file <- function(file_path = NULL) {

  #Check to make sure the filetype is correct
  if(!rio::get_ext(file_path) %in% c('csv','xlsx','xls')){
    stop(paste0(basename(file_path),'s filetype is not usable. It must be a .csv, .xlsx, or .xls filetype. Please correct the filetype before continuing'))
  }

  # Import SWAN Scores
  df <- rio::import(file_path)

  # Check for Required Questions
  required_cols <- c('swan1','swan2','swan3','swan4','swan5','swan6','swan7','swan8','swan9',
                     'swan10','swan11','swan12','swan13','swan14','swan15','swan16','swan17','swan18')

  if(!all(required_cols %in% colnames(df))){
    stop(paste('Please check the column names in your file. There should at least 18 columns, i.e. one for each question in the SWAN.',
               'They are required to be named as follows:',
               paste(required_cols, collapse = ", ")))
  }

  # Check for impossible values
  df_long <- df |>
    tidyr::pivot_longer(cols = all_of(required_cols)) |>
    dplyr::filter(value > 3 | value < -3)

  if(nrow(df_long) > 0){
    stop(paste("There appear to be",nrow(df_long),"values above 3 or below -3 in the file. These are not possible in the SWAN test.",
               "Please correct or remove the rows from the filing before trying again."))
  }


  return(list(df = df))
}

