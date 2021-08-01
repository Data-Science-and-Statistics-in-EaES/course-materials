Great Lakes fishing and stocking - data wrangling
================
Gavin McNicol

<div class="figure">

<img src="img/stocking.jpeg" alt="Young fish being discharged from pipe" width="50%" />
<p class="caption">
Young fish being discharged from pipe
</p>

</div>

Source: [Great Lakes
Databse](http://www.glfc.org/great-lakes-databases.php)

``` r
library(tidyverse)
library(skimr)
```

``` r
# From TidyTuesday: https://github.com/rfordatascience/tidytuesday/blob/master/data/2021/2021-06-08/readme.md
fishing <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-06-08/fishing.csv')
stocked <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-06-08/stocked.csv')
```

## Exercises

### Exercise 1.

Warm up! Take a look at an overview of the first dataset `fishing` with
the `skim()` function.

**Note:** I already gave you the answers to this exercise. You just need
to knit the document and view the output. A definition of all variables
is given in the [Data dictionary](#data-dictionary) section at the end,
though you don’t need to familiarize yourself with all variables in
order to work through these exercises.

``` r
skim(fishing)
```

|                                                  |         |
|:-------------------------------------------------|:--------|
| Name                                             | fishing |
| Number of rows                                   | 65706   |
| Number of columns                                | 7       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |         |
| Column type frequency:                           |         |
| character                                        | 4       |
| numeric                                          | 3       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |         |
| Group variables                                  | None    |

Data summary

**Variable type: character**

| skim\_variable | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
|:---------------|-----------:|---------------:|----:|----:|------:|----------:|-----------:|
| lake           |          0 |           1.00 |   4 |  11 |     0 |         6 |          0 |
| species        |          0 |           1.00 |   4 |  29 |     0 |        51 |          0 |
| comments       |      60179 |           0.08 |   3 | 607 |     0 |       166 |          0 |
| region         |          0 |           1.00 |   9 |  22 |     0 |        24 |          0 |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate |    mean |      sd |   p0 |  p25 |     p50 |    p75 |  p100 | hist  |
|:---------------|-----------:|---------------:|--------:|--------:|-----:|-----:|--------:|-------:|------:|:------|
| year           |          0 |           1.00 | 1954.46 |   38.66 | 1867 | 1922 | 1958.00 | 1988.0 |  2015 | ▂▆▆▇▇ |
| grand\_total   |      31767 |           0.52 | 1411.86 | 3572.20 |    0 |   10 |  107.57 |  964.5 | 48821 | ▇▁▁▁▁ |
| values         |      21916 |           0.67 |  513.97 | 1850.96 |  -31 |    0 |   17.00 |  217.0 | 48405 | ▇▁▁▁▁ |

Now let’s take a look at an overview of the second dataset `stocked`.

``` r
skim(stocked)
```

|                                                  |         |
|:-------------------------------------------------|:--------|
| Name                                             | stocked |
| Number of rows                                   | 56232   |
| Number of columns                                | 31      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |         |
| Column type frequency:                           |         |
| character                                        | 14      |
| logical                                          | 3       |
| numeric                                          | 14      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |         |
| Group variables                                  | None    |

Data summary

**Variable type: character**

| skim\_variable | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
|:---------------|-----------:|---------------:|----:|----:|------:|----------:|-----------:|
| LAKE           |          0 |           1.00 |   2 |   2 |     0 |         6 |          0 |
| STATE\_PROV    |          2 |           1.00 |   2 |   2 |     0 |         9 |          0 |
| SITE           |         61 |           1.00 |   3 |  70 |     0 |      4212 |          0 |
| ST\_SITE       |      37785 |           0.33 |   3 |  49 |     0 |      1394 |          0 |
| STAT\_DIST     |       2050 |           0.96 |   2 |   4 |     0 |        86 |          0 |
| LS\_MGMT       |      50731 |           0.10 |   1 |  11 |     0 |        42 |          0 |
| SPECIES        |          0 |           1.00 |   3 |   3 |     0 |        18 |          0 |
| STRAIN         |      13410 |           0.76 |   1 |  60 |     0 |       340 |          0 |
| STAGE          |        250 |           1.00 |   1 |   3 |     0 |        16 |          0 |
| MARK           |        321 |           0.99 |   2 |  40 |     0 |       162 |          0 |
| LOT\_CODE      |      22134 |           0.61 |   1 |  74 |     0 |      6977 |          0 |
| STOCK\_METH    |      12397 |           0.78 |   1 |  39 |     0 |        33 |          0 |
| AGENCY         |          6 |           1.00 |   3 |  15 |     0 |        31 |          0 |
| NOTES          |      28539 |           0.49 |   1 | 255 |     0 |     12873 |          0 |

**Variable type: logical**

| skim\_variable | n\_missing | complete\_rate | mean | count  |
|:---------------|-----------:|---------------:|-----:|:-------|
| LATITUDE       |      56232 |              0 |  NaN | :      |
| LONGITUDE      |      56230 |              0 |    0 | FAL: 2 |
| TAG\_NO        |      56232 |              0 |  NaN | :      |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate |       mean |         sd |   p0 |      p25 |      p50 |         p75 |     p100 | hist  |
|:---------------|-----------:|---------------:|-----------:|-----------:|-----:|---------:|---------:|------------:|---------:|:------|
| SID            |          0 |           1.00 | 8522639.03 | 9942287.02 |    1 | 15376.75 | 31096.50 | 20132395.25 | 20198457 | ▇▁▁▁▆ |
| YEAR           |          0 |           1.00 |    1997.93 |      12.37 | 1950 |  1989.00 |  1999.00 |     2008.00 |     2018 | ▁▂▅▇▇ |
| MONTH          |      11414 |           0.80 |       5.29 |       2.14 |    1 |     4.00 |     5.00 |        6.00 |       12 | ▂▇▂▁▂ |
| DAY            |      13233 |           0.76 |      15.65 |       8.80 |    0 |     8.00 |    16.00 |       23.00 |       31 | ▇▇▇▇▇ |
| GRID           |       3089 |           0.95 |    1056.89 |     637.00 |    0 |   607.00 |   905.00 |     1410.00 |     2806 | ▅▇▅▂▂ |
| NO\_STOCKED    |          7 |           1.00 |   35368.30 |  151724.41 |    0 |  7213.00 | 15000.00 |    34600.00 | 16586200 | ▇▁▁▁▁ |
| YEAR\_CLASS    |      17384 |           0.69 |    2001.34 |      15.12 |    0 |  1995.00 |  2003.00 |     2010.00 |     2018 | ▁▁▁▁▇ |
| AGEMONTH       |      29511 |           0.48 |      13.60 |      10.53 |    0 |    10.00 |    15.00 |       16.00 |      180 | ▇▁▁▁▁ |
| MARK\_EFF      |      50721 |           0.10 |      79.16 |      37.68 |    0 |    90.20 |    98.00 |       99.40 |      100 | ▂▁▁▁▇ |
| TAG\_RET       |      53587 |           0.05 |      95.15 |      11.34 |    0 |    95.20 |    97.87 |       99.00 |      100 | ▁▁▁▁▇ |
| LENGTH         |      30652 |           0.45 |     160.58 |     132.68 |    0 |   129.00 |   161.37 |      185.54 |    13780 | ▇▁▁▁▁ |
| WEIGHT         |      13445 |           0.76 |     678.62 |     883.83 |    0 |   136.08 |   453.59 |      862.00 |    50268 | ▇▁▁▁▁ |
| CONDITION      |      16868 |           0.70 |       0.83 |       1.66 |    0 |     0.00 |     0.00 |        1.00 |        7 | ▇▁▁▁▁ |
| VALIDATION     |      10281 |           0.82 |       5.80 |       3.61 |    0 |     2.00 |     5.00 |        9.00 |       10 | ▆▁▅▁▇ |

### Exercise 2.

Are people traveling on a whim? Let’s see…

Fill in the blanks for filtering for hotel bookings where the guest is
**not** from the US (`country` code `"USA"`) and the `lead_time` is less
than 1 day.

**Note:** You will need to set `eval=TRUE` when you have an answer you
want to try out.

``` r
hotels %>%
  filter(
    country ____ "USA", 
    lead_time ____ ____
    )
```

### Exercise 3.

How many bookings involve at least 1 child **or** baby?

In the following chunk, replace

-   `[AT LEAST]` with the logical operator for “at least” (in two
    places)
-   `[OR]` with the logical operator for “or”

**Note:** You will need to set `eval=TRUE` when you have an answer you
want to try out.

``` r
hotels %>%
  filter(
    children [AT LEAST] 1 [OR] babies [AT LEAST] 1
    )
```

### Exercise 4.

Do you think it’s more likely to find bookings with children or babies
in city hotels or resort hotels? Test your intuition. Using `filter()`
determine the number of bookings in resort hotels that have more than 1
child **or** baby in the room? Then, do the same for city hotels, and
compare the numbers of rows in the resulting filtered data frames.

``` r
# add code here
# pay attention to correctness and code style
```

``` r
# add code here
# pay attention to correctness and code style
```

### Exercise 5.

Create a frequency table of the number of `adults` in a booking. Display
the results in descending order so the most common observation is on
top. What is the most common number of adults in bookings in this
dataset? Are there any surprising results?

**Note:** Don’t forget to label your R chunk as well (where it says
`label-me-1`). Your label should be short, informative, and shouldn’t
include spaces. It also shouldn’t repeat a previous label, otherwise R
Markdown will give you an error about repeated R chunk labels.

``` r
# add code here
# pay attention to correctness and code style
```

### Exercise 6.

Repeat Exercise 5, once for canceled bookings (`is_canceled` coded as 1)
and once for not canceled bookings (`is_canceled` coded as 0). What does
this reveal about the surprising results you spotted in the previous
exercise?

**Note:** Don’t forget to label your R chunk as well (where it says
`label-me-2`).

``` r
# add code here
# pay attention to correctness and code style
```

### Exercise 7.

Calculate minimum, mean, median, and maximum average daily rate (`adr`)
grouped by `hotel` type so that you can get these statistics separately
for resort and city hotels. Which type of hotel is higher, on average?

``` r
# add code here
# pay attention to correctness and code style
```

### Exercise 8.

We observe two unusual values in the summary statistics above – a
negative minimum, and a very high maximum). What types of hotels are
these? Locate these observations in the dataset and find out the arrival
date (year and month) as well as how many people (adults, children, and
babies) stayed in the room. You can investigate the data in the viewer
to locate these values, but preferably you should identify them in a
reproducible way with some code.

**Hint:** For example, you can `filter` for the given `adr` amounts and
`select` the relevant columns.

``` r
# add code here
# pay attention to correctness and code style
```

## Data dictionary

Below is the full data dictionary. Note that it is long (there are lots
of variables in the second dataset), but we will be using a limited set
of the variables for our analysis.

### fishing.csv

| variable     | class     | description                                                         |
|:-------------|:----------|:--------------------------------------------------------------------|
| year         | double    | Year of measurement                                                 |
| lake         | character | Lake Name                                                           |
| species      | character | Species of fish                                                     |
| grand\_total | double    | Grand total of observed                                             |
| comments     | character | Comments from the dataset providers                                 |
| region       | character | Region of the US/Canada, note there is some inconsistency           |
| values       | double    | Production amounts have been rounded to the nearest thousand pounds |

### stocked.csv

| variable     | class     | description                                                         |
|:-------------|:----------|:--------------------------------------------------------------------|
| year         | double    | Year of measurement                                                 |
| lake         | character | Lake Name                                                           |
| species      | character | Species of fish                                                     |
| grand\_total | double    | Grand total of observed                                             |
| comments     | character | Comments from the dataset providers                                 |
| region       | character | Region of the US/Canada, note there is some inconsistency           |
| values       | double    | Production amounts have been rounded to the nearest thousand pounds |
