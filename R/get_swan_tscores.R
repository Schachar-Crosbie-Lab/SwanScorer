#### Create Wrapper Function ####
#' @name get_swan_tscores
#'
#' @title Run analysis on SWAN raw values to return t-scores
#'
#' @description Write more detailed when finished
#'
#' @param file character - pathway to formatted raw SWAN scores
#' @param output_folder Optional parameter, to export a csv file of the t-scores
#'
#' @importFrom rio export
#' @importFrom lubridate now
#'
#' @returns table with t-scores attached to raw swan values
#'
#' @export
#'
#'

get_swan_tscores <- function(file = NULL, output_folder = NULL) {

  if(is.null(file)){
    file <- file.choose()
  }

  check <- clean_file(file)
  summary <- build_summary(check)
  score <- run_model(summary)

  if(!is.null(output_folder)){

    rio::export(score,
                file.path(output_folder,paste0('swan_scored_',format(lubridate::now(), format='%Y%m%d%H%M%S'),'.csv')))

    message(paste("A spreadsheet of your scored SWAN tests has been saved to",output_folder))

  }

  return(score = score)

}
