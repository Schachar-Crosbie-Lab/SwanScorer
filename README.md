
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

    <table style="width:46%;">
    <colgroup>
    <col style="width: 15%" />
    <col style="width: 15%" />
    <col style="width: 15%" />
    </colgroup>
    <thead>
    <tr>
    <th>Column Name</th>
    <th>Ad ditional Inf ormation</th>
    <th>Values</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td>age</td>
    <td>The child’s age</td>
    <td>5 - 18</td>
    </tr>
    <tr>
    <td>gender</td>
    <td>The child’s gender</td>
    <td><p>1 = Male</p>
    <p>2 = Female</p></td>
    </tr>
    <tr>
    <td>p_re spondent</td>
    <td>Whether the survey was filled out by the parent or the child</td>
    <td><p>1 = Parent R e spondent</p>
    <p>0 = Child / Youth Self R e spondent</p></td>
    </tr>
    <tr>
    <td>swan1</td>
    <td>1. Give close a ttention to detail and avoid careless mistakes</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan2</td>
    <td>2. Sustain a ttention on tasks and play a c tivities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan3</td>
    <td>3. Listen when spoken to directly</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan4</td>
    <td>4. Follow through on i n s t ructions and finish s c hoolwork /
    chores</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan5</td>
    <td>5. Organize tasks and a c tivities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan6</td>
    <td>6. Engage in tasks that require s ustained mental effort</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan7</td>
    <td>7. Keep track of things n ecessary for a c tivities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan8</td>
    <td>8. Ignore e x traneous stimuli (able to ignore b a ckground n o i s
    e / d i s t r actions)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan9</td>
    <td>9. Remember daily a c tivities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan10</td>
    <td>10. Sit still (control m ovements of hands / feet or control s q
    uirming)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan11</td>
    <td>11. Stay seated (when required by class rules / social c o n v
    entions)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>swan12</td>
    <td>12. Modulate motor activity (inhibit i n a p p ropriate running / c
    limbing)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan13</td>
    <td>13. Play quietly (keep noise level r e a sonable)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan14</td>
    <td>14. Settle down and rest (control constant a ctivity)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan15</td>
    <td>15. Modulate verbal activity (control excess talking)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan16</td>
    <td>16. Reflect on q uestions (control blurting out answers)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan17</td>
    <td>17. Await turn (stand in line and take turns)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan18</td>
    <td>18. Enter into c o n v e rsations and games (control i n t e
    rrupting / i n truding)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
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
