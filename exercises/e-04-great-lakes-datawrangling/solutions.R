# e-04 solutions


### Exercise 3.

fishing %>%
  filter(
    region ___ "U.S. Total",
    year [LESS THAN] 1950 [AND] values [AT LEAST] 30000
  )
levels(factor(fishing$species))

### Exercise 4.

fishing %>% 
  filter(lake == "Michigan",
         year == 2015 | year == 1975,
         region == "U.S. Total") %>% 
  arrange(desc(values)) %>% 
  select(year, species, values)

### Exercise 5.

fishing %>% 
  filter(lake == "Michigan",
         species == "Alewife",
         year > 1975,
         region == "U.S. Total",
         values < 10000) %>% 
  arrange(year)
