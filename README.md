
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SwanScorer

<!-- badges: start -->

<!-- badges: end -->

The Strengths and Weaknesses of ADHD Symptoms and Normal Behavior Rating
Scale (SWAN) is a validated instrument for measuring
attention-deficit/hyperactivity disorder (ADHD) traits ([Burton et al.,
2018](https://doi.org/10.1101/248484)). The SwanScorer package provides
an easy way to automatically score your SWAN tests.

## Instructions

### Formatting Your Data

Our first step is to prepare your raw SWAN data.

1.  Prepare a spreadsheet, preferably a .csv file, with a row for each
    of the tests you’d like to score.

2.  Be sure the following columns are present in the spreadsheet and
    rename the columns to match the reference guide below. All of the
    following columns are necessary for the model. If age, gender, or
    p_respondent are missing from a row, the model will not return a
    t-score for that row.

    <div>

    | Column Name | Additional Information | Example |
    |----|----|----|
    | age | The child’s age | 5 - 18 |
    | gender | The child’s gender | 1 = Male, 2 = Female |
    | p_respondent | Whether the survey was filled out by the parent or the child | 1 = Parent Respondent, 0 = Child / Youth Self-Respondent |
    | swan1 | 1\. Give close attention to detail and avoid careless mistakes | -3 (Far Below) to 3 (Far Above) |

    <table style="width:64%;">
    <colgroup>
    <col style="width: 16%" />
    <col style="width: 1%" />
    <col style="width: 15%" />
    <col style="width: 1%" />
    <col style="width: 15%" />
    <col style="width: 1%" />
    <col style="width: 12%" />
    </colgroup>
    <tbody>
    <tr>
    <td colspan="7">Column | A | Values | Name | dditional | | | in | | |
    formation | | ============ +===========+===========+ age | The | 5 - 18
    | | child’s | | | age | |</td>
    </tr>
    <tr>
    <td colspan="2">gender</td>
    <td colspan="2">The child’s gender</td>
    <td colspan="2"><p>1 = Male</p>
    <p>2 = Female</p></td>
    <td></td>
    </tr>
    <tr>
    <td colspan="7">p_respondent | Whether | 1 = espondent | the | Parent |
    | survey | R | | was | espondent | | filled | | | out by | 0 = Child | |
    the | / Youth | | parent or | Self | | the child | R | | | espondent
    |</td>
    </tr>
    <tr>
    <td colspan="2">swan1</td>
    <td colspan="2">1. Give close attention to detail and avoid careless
    mistakes</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    </tr>
    <tr>
    <td colspan="7">swan2 | 2. | -3 (Far | | Sustain | Below) to | |
    attention | 3 (Far | | on tasks | Above) | | and play | | | a | | |
    ctivities | |</td>
    </tr>
    <tr>
    <td>swan3</td>
    <td colspan="2">3. Listen when spoken to directly</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan4</td>
    <td colspan="2">4. Follow through on i n s tructions and finish s
    choolwork / chores</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan5</td>
    <td colspan="2">5. Organize tasks and a ctivities</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan6</td>
    <td colspan="2">6. Engage in tasks that require sustained mental
    effort</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan7</td>
    <td colspan="2">7. Keep track of things necessary for a ctivities</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan8</td>
    <td colspan="2">8. Ignore e xtraneous stimuli (able to ignore b
    ackground n oise/dist ractions)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan9</td>
    <td colspan="2">9. Remember daily a ctivities</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan10</td>
    <td colspan="2">10. Sit still (control movements of hands / feet or
    control s quirming)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan11</td>
    <td colspan="2">11. Stay seated (when required by class rules / social
    con ventions)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan12</td>
    <td colspan="2">12. Modulate motor activity (inhibit inap propriate
    running / climbing)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan13</td>
    <td colspan="2">13. Play quietly (keep noise level re asonable)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan14</td>
    <td colspan="2">14. Settle down and rest (control constant
    activity)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan15</td>
    <td colspan="2">15. Modulate verbal activity (control excess
    talking)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan16</td>
    <td colspan="2">16. Reflect on questions (control blurting out
    answers)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan17</td>
    <td colspan="2">17. Await turn (stand in line and take turns)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan18</td>
    <td colspan="2">18. Enter into conv ersations and games (control int
    errupting / i ntruding)</td>
    <td colspan="2">-3 (Far Below) to 3 (Far Above)</td>
    <td></td>
    <td></td>
    </tr>
    </tbody>
    </table>

    </div>

3.  Any additional columns in the spreadsheet, i.e. an identifier, will
    remain untouched in the spreadsheet

### Installation

You can install the development version of SwanScorer from
[GitHub](https://github.com/jclutton/SwanScorer) with:

``` r
# If the pak package isn't installed already, do so first. 
install.packages("pak")

pak::pak("jclutton/SwanScorer")
```

### Generate Scores

Use the code below to generate your t-scores. First, You will be
prompted to select your file. Second, we will check that your data are
formatted properly. And third, t-scores for the full test as well as the
two subdomains (inattentive and hyperactive) will all be generated

``` r
library(SwanScorer)

# The get_swan_tscores checks that your data are formatted correctly and generates the t-scores
swan_tscores <- get_swan_tscores()
```

### Additional options

You have the option to specify…

1.  the file path of the input file

2.  a folder to save a output spreadsheet with the t-scores

``` r
library(here)
library(SwanScorer)

# Example of how to specify the input file
swan_tscores <- get_swan_tscores(file = here("test_scores.csv"))

# Example of how to automatically save a spreadsheet
swan_tscores <- get_swan_tscores(output_folder = here())
```

## Understanding the Output

### T-scores for generic model

| Column | Description |
|----|----|
| swan_gender_tscores | A t-score across the full SWAN test that adjusts for age, respondent, and gender |
| swan_tscores | A t-score across the full SWAN test that adjusts for age and respondent |
| swan_ia_gender_tscores | A t-score of the inattentive subdomain (questions 1-9) that adjusts for age, respondent, and gender |
| swan_ia_tscores | A t-score of the inattentive subdomain (questions 1-9) that adjusts for age and respondent |
| swan_hi_gender_tscores | A t-score of the hyperactive subdomain (questions 10-18) that adjusts for age, respondent, and gender |
| swan_hi_tscores | A t-score of the hyperactive subdomain (questions 10-18) that adjusts for age and respondent |

### T-scores for longitudinal model

| Column | Description |
|----|----|
| swan_gender_time_tscores | A t-score across the full SWAN test that adjusts for age, respondent, and gender |
| swan_time_tscores | A t-score across the full SWAN test that adjusts for age and respondent |
| swan_ia_gender_time_tscores | A t-score of the inattentive subdomain (questions 1-9) that adjusts for age, respondent, and gender |
| swan_ia_time_tscores | A t-score of the inattentive subdomain (questions 1-9) that adjusts for age and respondent |
| swan_hi_gender_time_tscores | A t-score of the hyperactive subdomain (questions 10-18) that adjusts for age, respondent, and gender |
| swan_hi_time_tscores | A t-score of the hyperactive subdomain (questions 10-18) that adjusts for age and respondent |

### Summary values regardless of model

| Column | Description |
|----|----|
| swan_tot | A summed score of the answered questions across the whole test |
| swan_miss | A count of missing values across the whole test |
| swan_pro | A prorated score by dividing swan_tot by the number of answered questions across the whole test |
| swan_ia_tot | A summed score of the answered questions across the inattentive subdomain |
| swan_ia_miss | A count of missing values across the inattentive subdomain |
| swan_ia_pro | A prorated score by dividing swan_tot by the number of answered questions across the inattentive subdomain |
| swan_hi_tot | A summed score of the answered questions across the hyperactive subdomain |
| swan_hi_miss | A count of missing values across the hyperactive subdomain |
| swan_hi_pro | A prorated score by dividing swan_tot by the number of answered questions across the hyperactive subdomain |
