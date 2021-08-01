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

### Exercise 2.

Which species and years are associated with the largest total U.S fish
catches from Lake Michigan?

Let’s see…

Fill in the blanks for filtering for Great Lakes annual fish catch where
the region is from the US (`region` code `"U.S.Total"`) and the lake is
Lake Michigan (`lake` code `Michigan`). Then pipe the results into the
`slice_max()` function we have used before, so we can select the 5 years
with the largest catch (coded as production `values`). Note: production
`values` are rounded to the nearest thousand pounds.

**Note:** You will need to set `eval=TRUE` in the r code chunk header
when you have an answer you want to try out.

``` r
fishing %>%
  filter(
    lake ___ "___",
    region ___ "U.S. Total"
    ) %>% 
  slice_max(
    order_by = ___, 
    n = 5
      )
```

### Exercise 3.

How many very large (at least 10,000,000 lbs) fish catches were there
before 1950, and which species were they catching in such large
quantities?

In the following chunk, replace

-   `[AT LEAST]` with the logical operator for “at least”
-   `[LESS THAN]` with the logical operator for “less than”
-   `[AND]` with the logical operator for “and”

**Note:** You will need to set `eval=TRUE` when you have an answer you
want to try out.

``` r
fishing %>%
  filter(
    region ___ "U.S. Total",
    year [LESS THAN] 1950 [AND] values [AT LEAST] 30000
    )
levels(factor(fishing$species))
```

### Exercise 4.

Do you think more fishes are caught in Lake Michigan now, compared to
1975?

Test your intuition with data…

Using `filter()` determine the largest total U.S. catches from Lake
Michigan in the years 2015 and 1975. Simplify your output by using
`select()` to select only `year`, `species`, and `values`.

``` r
# add code here
# pay attention to correctness and code style
```

Was your intuition correct?

### Exercise 5.

`Pacific Salmon` were introduced to the Great Lakes to reduce the large
`Alewife` populations during the second half of the 20th century. Which
year after 1975 did the total U.S. catch of `Alewife` drop below
10,000,000 lbs?

Using `filter()` determine the size of U.S. total catches of Alewife
from Lake Michigan after 1975 that were less than 10,000,000 lbs, then
use `arrange()` to identify the earliest year.

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
