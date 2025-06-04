
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

    <table style="width:67%;">
    <colgroup>
    <col style="width: 22%" />
    <col style="width: 22%" />
    <col style="width: 22%" />
    </colgroup>
    <thead>
    <tr>
    <th>Column Name</th>
    <th>Additional Information</th>
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
    <td>p_respondent</td>
    <td>Whether the survey was filled out by the parent or the child</td>
    <td><p>1 = Parent Respondent</p>
    <p>0 = Child / Youth Self Respondent</p></td>
    </tr>
    <tr>
    <td>swan1</td>
    <td>1. Give close attention to detail and avoid careless mistakes</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan2</td>
    <td>2. Sustain attention on tasks and play activities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan3</td>
    <td>3. Listen when spoken to directly</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan4</td>
    <td>4. Follow through on instructions and finish schoolwork /
    chores</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan5</td>
    <td>5. Organize tasks and activities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan6</td>
    <td>6. Engage in tasks that require sustained mental effort</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan7</td>
    <td>7. Keep track of things necessary for activities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan8</td>
    <td>8. Ignore extraneous stimuli (able to ignore background n o i s e /
    distractions)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan9</td>
    <td>9. Remember daily activities</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan10</td>
    <td>10. Sit still (control movements of hands / feet or control
    squirming)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan11</td>
    <td>11. Stay seated (when required by class rules / social
    conventions)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan12</td>
    <td>12. Modulate motor activity (inhibit inappropriate running /
    climbing)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan13</td>
    <td>13. Play quietly (keep noise level reasonable)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan14</td>
    <td>14. Settle down and rest (control constant activity)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan15</td>
    <td>15. Modulate verbal activity (control excess talking)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan16</td>
    <td>16. Reflect on questions (control blurting out answers)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan17</td>
    <td>17. Await turn (stand in line and take turns)</td>
    <td>-3 (Far Below) to 3 (Far Above)</td>
    </tr>
    <tr>
    <td>swan18</td>
    <td>18. Enter into conversations and games (control interrupting /
    intruding)</td>
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

| Column | Description |
|----|----|
| swan_gender_study_tscores | A t-score across the full SWAN test with gender in the model |
| swan_study_tscores | A t-score across the full SWAN test without gender in the model |
| swan_ia_gender_study_tscores | A t-score of the inattentive subdomain (questions 1-9) with gender in the model |
| swan_ia_study_tscores | A t-score of the inattentive subdomain (questions 1-9) without gender in the model |
| swan_hi_gender_study_tscores | A t-score of the hyperactive subdomain (questions 10-18) with gender in the model |
| swan_hi_study_tscores | A t-score of the hyperactive subdomain (questions 10-18) without gender in the model |
