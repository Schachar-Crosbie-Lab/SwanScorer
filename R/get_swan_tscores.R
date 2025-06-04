#' @name get_swan_tscores
#'
#' @title Run analysis on SWAN raw values to return t-scores
#'
#' @description Write more detailed when finished
#'
#' @param file Pathway to formatted raw SWAN scores
#' @param output_folder Optional parameter, to export a csv file of the t-scores
#' @param model Select general or longitudinal.
#' General adjusts for time and is generally recommended.
#' Longitudinal does not adjust for time. Use longitudinal when studying SWAN scores over time.
#'
#' @importFrom rio export
#' @importFrom lubridate now
#' @importFrom dplyr select
#' @importFrom dplyr rename
#' @importFrom stringr str_replace_all
#' @importFrom stats sd
#'
#' @returns table with t-scores attached to raw swan values
#'
#' @export
#'
#'

get_swan_tscores <- function(file = NULL, output_folder = NULL, model = 'general') {

  if(is.null(file)){
    file <- file.choose()
  }

  # Run QC checks on data
  check <- clean_file(file)

  # Summarize Scores
  summary <- build_summary(check)

  # Run selected model
  if(model == 'general'){
    score <- run_model(summary) |>
      dplyr::select(-age18, female, youth)

    colnames(score) <- stringr::str_replace_all(colnames(score), "study", "time")

    message(paste0("The model scored ",sum(!is.na(score$swan_gender_time_tscores))," observations."))

    print(
      score |>
        dplyr::group_by(gender, youth, p_respondent) |>
        dplyr::summarise(n = dplyr::n(),
                         mean = mean(swan_gender_time_tscores, na.rm = T),
                         sd = sd(swan_gender_time_tscores, na.rm = T))
    )


  } else if(model == 'longitudinal'){
    score <- run_longitudinal_model(summary) |>
      dplyr::select(-age18, female, youth)

    message(paste0("The model scored ",sum(!is.na(score$swan_gender_tscores))," observations."))

    print(
      score |>
        dplyr::group_by(gender, youth, p_respondent) |>
        dplyr::summarise(n = dplyr::n(),
                         mean = mean(swan_gender_tscores, na.rm = T),
                         sd = sd(swan_gender_tscores, na.rm = T))
    )

  } else {
    stop("You selected an option for model. Please select either 'general' or 'longitudinal'.")
  }



  if(!is.null(output_folder)){

    rio::export(score,
                file.path(output_folder,paste0('swan_scored_',format(lubridate::now(), format='%Y-%m-%d %H-%M-%S'),'.csv')))

    message(paste("A spreadsheet of your scored SWAN tests has been saved to",output_folder))

  }

  return(score = score)

}
