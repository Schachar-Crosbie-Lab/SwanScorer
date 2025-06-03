#required_libraries <- c('tidyverse', 'rio', 'janitor')

#### Load language ####
#### Declares language upload loading the package.
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("SwanScorer has been loaded")
}

#### Global Variables ####
globalVariables(c("value",
                  'swan1','swan2','swan3','swan4','swan5','swan6','swan7','swan8','swan9',
                  'swan10','swan11','swan12','swan13','swan14','swan15','swan16','swan17','swan18',
                  'age','gender'))

#### clean_file function ####
#' @name clean_file
#'
#' @title Clean File
#'
#' @description This function checks that the uploaded SWAN score file does not have any issues with the SWAN
#' values or the gender and age coding
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
#'
clean_file <- function(file_path = NULL) {

  #Check to make sure the filetype is correct
  if(!rio::get_ext(file_path) %in% c('csv','xlsx','xls')){
    stop(paste0(basename(file_path),'s filetype is not usable. It must be a .csv, .xlsx, or .xls filetype. Please correct the filetype before continuing'))
  }

  # Import SWAN Scores
  df <- rio::import(file_path)

  # Check for Required Questions
  required_test_cols <- c('swan1','swan2','swan3','swan4','swan5','swan6','swan7','swan8','swan9',
                     'swan10','swan11','swan12','swan13','swan14','swan15','swan16','swan17','swan18')

  required_dem_cols <- c('age','gender')

  if(!all(c(required_test_cols,required_dem_cols) %in% colnames(df))){
    stop(paste('Please check the column names in your file. There should at least 20 columns, i.e. one for each question in the SWAN.',
               'They are required to be named as follows:',
               paste(required_test_cols, required_dem_cols, collapse = ", ")))
  }

  # Check for impossible values
  df_long <- df |>
    tidyr::pivot_longer(cols = dplyr::all_of(required_test_cols)) |>
    dplyr::filter(value > 3 | value < -3)

  if(nrow(df_long) > 0){
    stop(paste("There appear to be",nrow(df_long),"values above 3 or below -3 in the file. These are not possible in the SWAN test.",
               "Please correct or remove the rows from the filing before trying again."))
  }

  # Check that Age is formatted correctly
  if(any(df$age >= 19)){
    stop(paste("Some of your records have an age above 18. T-scores are applicable only for individuals aged 5-18.",
               "Please check that ages are correct and remove any 19 or above"))
  }

  if(any(df$age < 5)){
    stop(paste("Some of your records have an age below 5. T-scores are applicable only for individuals aged 5-18.",
               "Please check that ages are correct and records below 5."))
  }

  # Check gender
  if(!any(unique(df$gender) %in% c('1','2', NA) )){
    stop(paste("It appears as though some of your gender values are formatted incorrectly. Gender should be coded as... \n",
               "1 = Male \n",
               "2 = Female \n"))
  }

  return(df = df)
}





#' @name mkvars
#'
#' @title Make Variables - Subset SWAN to subdomains.
#'
#' @author Annie
#'
#' @description Pass the root of the test with the question numbers to subset the SWAN. 1-9 = Inattentive. 10-18 = Hyperactive.
#' Function to list all questionnaire items (and not have to type them out) - used throughout
#' a:  first item number (usually "1", but when referencing subdomains, or for SWAN ODD, first item may be something other than 1
#' b:  last item number
#' root:  part of the item name that doesn't change (eg:  for swan1 to swan18, the root is "swan" )
#'
#' @importFrom stringr str_c
#'
#' @param a First question of subset
#' @param b Last question of subset
#' @param root Root name of
#'
#' @returns A data frame ready for use or an error
mkvars <- function(a = NULL, b = NULL, root = 'swan') {
  cnams <- NULL
  for (i in a:b) {
    cnams[i - a + 1] <- stringr::str_c(root, i)
  }
  return(cnams)
}

#' @name mkpro
#'
#' @title Make Prorated Scores
#'
#' @author Annie
#'
#' @description
#' a: first item number in questionnaire (usually "1")
# b: last item number in questionnaire
# root: non numeric part of the item name (see calls to the function below)
# maxmiss: minimum number of missing values that sets total and prorated total to missing
#          WARNING: default does not set any totals or pro-rated totals to missing to leave this up to the individual analyst
# dat: name of data frame with items - default is S2quest
# newroot: root for new variable names if different (used for subdomain totals) - default if newroot is not specified in call to function, newroot = root
#'
#' @param dat should be a data.frame from [clean_file()]
#' @param maxmiss maximum number of missing values before can be considered invalid
#' @inheritParams mkvars
#' @param newroot a new name if root names need to be changed
#'
#' @returns A data frame ready for use or an error
#'
mkpro <- function(maxmiss = NA, dat = NA, a = NULL, b = NULL, root = 'swan', newroot = 'swan' ) {


  cnams <- mkvars(a, b, root)
  n <- length(cnams)

  tot <- apply(dat[, cnams], 1 , sum, na.rm = T)
  miss <- apply(dat[, cnams], 1 , function(x)
    sum(is.na(x)))
  pro <- tot / (n - miss) * n

  if (is.na(maxmiss))
    maxmiss <- n

  pro <- ifelse(miss >= maxmiss, NA, pro)
  tot <- ifelse(miss >= maxmiss, NA, tot)

  allvars <- cbind(tot, miss, pro)
  colnames(allvars) <-
    c(stringr::str_c(newroot, "_tot"),
      stringr::str_c(newroot, "_miss"),
      stringr::str_c(newroot, "_pro"))

  return(allvars)
}

#' @name build_summary
#'
#' @title Build Totals and Prorated Totals for Full Test and Subdomains
#'
#' @description Use the dataframe from [clean_file()] and the [mkpro()] functionto calculate totals, missingness, and pro-rated totals
#' for the total test and subdomains
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr case_when
#'
#' @param df should be a data.frame from [clean_file()]
#'
#' @returns A data frame with all of the totals columns
#'
build_summary <- function(df = NULL) {

  df_tot <- df |>
    dplyr::mutate(age18 = dplyr::case_when(age < 18 ~ age,
                                           age >= 18 ~ 18,
                                           T ~ age)) |>
    dplyr::mutate(female = dplyr::case_when(gender == 1 ~ 0,
                                            gender == 2 ~ 1))

  #Whole test scores
  df_tot <- cbind(df_tot, mkpro(dat = df, a = 1, b = 18))

  #Inattentive
  df_tot <- cbind(df_tot, mkpro(dat = df, a = 1, b = 9, newroot = 'swan_ia'))

  #Hyperactive
  df_tot <- cbind(df_tot, mkpro(dat = df, a = 10, b = 18, newroot = 'swan_hi'))

  return(df_tot = df_tot)

}


