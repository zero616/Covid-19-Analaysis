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
bullying_raw <- read.csv("inputs/data/bullying_raw_data.csv")
cyberbully_raw <- read.csv("cyberbully_raw_data.csv")
schbully_raw <- read.csv("schbully_raw_data.csv")

# clean data
# rename columns to improve readability
# choose 3 states to investigate
# add a column indicate the type of bullying
# select the desired columns
bully_clean <-
  bullying_raw |>
  rename(us_state = dma_json_code, num_of_searches = hits) |>
  filter(us_state %in% c("US-NY", "US-LA", "US-NJ")) |>
  mutate(bully_type = 'bully') |>
  select(us_state, date, num_of_searches, bully_type)

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


#### Save data ####
write_csv(bully_comb_clean, "outputs/data/bully_clean_data.csv")
