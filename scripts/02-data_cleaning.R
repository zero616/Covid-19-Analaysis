#### Preamble ####
# Purpose: Cleans the raw bully data and combine three bullying types
# into one table
# Author: Mary Cheng, Yimiao Yuan, Shipeng Zhang
# Date: 11 February 2024
# Contact: yimiaomail@gmail.com
# License: --
# Pre-requisites: run 01-download_data.R first to get the raw data


#### Workspace setup ####
# install required packages
# install.packages("tidyverse")

# load library
library(tidyverse)


#### Clean data ####
# read in the raw data
bullying_raw <- read.csv("../inputs/data/bullying_raw_data.csv")
cyberbully_raw <- read.csv("../inputs/data/cyberbully_raw_data.csv")
schbully_raw <- read.csv("../inputs/data/schbully_raw_data.csv")
LA_pop_2019<- read.csv("../inputs/data/US_LA_Population_2019.csv")
LA_pop_2020<- read.csv("../inputs/data/US_LA_Population_2020.csv")
NJ_pop_2019<- read.csv("../inputs/data/US_NJ_Population_2019.csv")
NJ_pop_2020<- read.csv("../inputs/data/US_NJ_Population_2020.csv")
NY_pop_2019<- read.csv("../inputs/data/US_NY_Population_2019.csv")
NY_pop_2020<- read.csv("../inputs/data/US_NY_Population_2020.csv")

# clean data
# rename columns to improve readability
# choose 3 states to investigate
# add a column indicate the type of bullying
# select the desired columns
NY_pop_2019_clean <-
  pop_2019 |>
  rename(Age = Age) |>
  filter(Age %in% c("5-9", "10-14", "15-17")) |>
  mutate(state = 'NY') |>
  select(Age, Total,state)

NY_pop_2020_clean <-
  pop_2020 |>
  rename(Age = Age) |>
  filter(Age %in% c("5-9", "10-14", "15-17")) |>
  mutate(state = 'NY') |>
  select(Age, Total,state)

NJ_pop_2019_clean <-
  pop_2019 |>
  rename(Age = Age) |>
  filter(Age %in% c("5-9", "10-14", "15-17")) |>
  mutate(state = 'NJ') |>
  select(Age, Total,state)

NJ_pop_2020_clean <-
  pop_2020 |>
  rename(Age = Age) |>
  filter(Age %in% c("5-9", "10-14", "15-17")) |>
  mutate(state = 'NJ') |>
  select(Age, Total,state)

LA_pop_2019_clean <-
  pop_2019 |>
  rename(Age = Age) |>
  filter(Age %in% c("5-9", "10-14", "15-17")) |>
  mutate(state = 'LA') |>
  select(Age, Total,state)

LA_pop_2020_clean <-
  pop_2020 |>
  rename(Age = Age) |>
  filter(Age %in% c("5-9", "10-14", "15-17")) |>
  mutate(state = 'LA') |>
  select(Age, Total,state)





bully_clean <-
  bullying_raw |>
  rename(us_state = dma_json_code, num_of_searches = hits) |>
  filter(us_state %in% c("US-NY", "US-LA", "US-NJ")) |>
  mutate(bully_type = 'sch_cyb_bully') |>
  select(us_state, date, num_of_searches, bully_type)
bully_with_US <-
  bullying_raw |>
  rename(us_state = dma_json_code, num_of_searches = hits) |>
  filter(us_state %in% c("US-NY", "US-LA", "US-NJ","US")) |>
  filter(date %in% c("2019-01-01", "2019-02-01", "2019-03-01","2019-04-01","2019-05-01", "2019-06-01", "2019-07-01","2019-08-01","2019-09-01", "2019-10-01", "2019-11-01","2019-12-01")) |>
  select(us_state, date, num_of_searches)

#us_hits <- sum(bully_with_US[bully_with_US$us_state == "US", "num_of_searches"])
#us_la_hits <- sum(bully_with_US[bully_with_US$us_state == "US-LA", "num_of_searches"])
#fraction <- us_la_hits / us_hits
#merged_data <- merge(bully_with_US, pop_data_2019)
state_ratios <- aggregate(num_of_searches ~ us_state, data = bully_with_US, sum)
us_hits <- sum(bully_with_US[bully_with_US$us_state == "US", "num_of_searches"])
state_ratios$fraction <- state_ratios$num_of_searches / us_hits

cyberbully_clean <-
  cyberbully_raw |>
  rename(us_state = dma_json_code, num_of_searches = hits) |>
  filter(us_state %in% c("US-NY", "US-LA", "US-NJ")) |>
  mutate(bully_type = 'cyberbully') |>
  select(us_state, date, num_of_searches, bully_type)

schbully_clean <-
  schbully_raw |>
  rename(us_state = dma_json_code, num_of_searches = hits) |>
  filter(us_state %in% c("US-NY", "US-LA", "US-NJ")) |>
  mutate(bully_type = 'schbully') |>
  select(us_state, date, num_of_searches, bully_type)

# combine 3 tables into 1 table
bully_comb <- bind_rows(bully_clean, cyberbully_clean)
bully_comb_clean <- bind_rows(bully_comb, schbully_clean)
pop_2019_comb<- bind_rows(NY_pop_2019_clean,NJ_pop_2019_clean,LA_pop_2019_clean)
pop_2020_comb<- bind_rows(NY_pop_2020_clean,NJ_pop_2020_clean,LA_pop_2020_clean)
#### Save data ####
write_csv(bully_comb_clean, "../outputs/data/bully_clean_data.csv")
write_csv(pop_2019_comb, "../outputs/data/pop_2019_comb.csv")
write_csv(pop_2020_comb, "../outputs/data/pop_2020_comb.csv")
write_csv(state_ratios, "../outputs/data/state_ratios.csv")
