# e-04 solutions

### Exercise 2.

fishing %>%
  filter(
    lake == "Michigan",
    region == "U.S. Total"
  ) %>% 
  slice_max(
    order_by = values, 
    n = 5
  )

### Exercise 3.

fishing %>%
  filter(
    region == "U.S. Total",
    year < 1950 & values >= 30000
  )

### Exercise 4.

fishing_us %>% 
  filter(
    lake == "Michigan",
    year == 2015 | year == 1975
    ) %>% 
  arrange(desc(values)) %>% 
  select(year, species, values) %>% 
  pivot_wider(names_from = "year",
              values_from = "values")

### Exercise 5.

fishing_us %>% 
  filter(
    species == "Chinook Salmon",
    lake == "Michigan"
  ) %>% 
  summarize(
    minimum = min(values, na.rm = TRUE),
    mean = mean(values, na.rm = TRUE),
    median = median(values, na.rm = TRUE),
    maximum = max(values, na.rm = TRUE)
  )

### Exercise 6.

fishing_us %>% 
  filter(
    lake == "Michigan",
    species == "Chinook Salmon",
    values == 57
  ) 

### Exercise 7.

fishing_us %>% 
  filter(
    lake == "Michigan",
    year %in% c(1975, 1985, 1995, 2005, 2015)
  ) %>% 
  group_by(year) %>% 
  summarize(total_catch = sum(values, na.rm = TRUE))

### Exercise 8.

fishing_us %>% 
  filter(
    year %in% c(1975, 1985, 1995, 2005, 2015)
  ) %>% 
  group_by(lake, year) %>% 
  summarize(total_catch = sum(values, na.rm = TRUE)) %>% 
  pivot_wider(
    names_from = "lake",
    values_from = "total_catch"
  )

### Exercise 9.

fishing %>% 
  filter(
    region %in% c("U.S. Total", "Total Canada (ONT)"),
    year %in% c(1975, 1985, 1995, 2005, 2015)
  ) %>% 
  group_by(lake, year) %>% 
  summarize(total_catch = sum(values, na.rm = TRUE)) %>% 
  pivot_wider(
    names_from = "lake",
    values_from = "total_catch"
  )


