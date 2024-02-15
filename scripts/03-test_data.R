#### Preamble ####
# Purpose: Tests the cleaned data and see if it is what we expected
# Author: Mary Cheng, Yimiao Yuan, Shipeng Zhang
# Date: 15 February 2024
# Contact: yimiaomail@gmail.com, maryc.cheng@mail.utoronto.ca
# License: --
# Pre-requisites: run 01-download_data.R 02-data_cleaning.R first to get the cleaned dataset


#### Workspace setup ####
library(tidyverse)

#### Read Data ####
file_path <- "../../outputs/data/bully_clean_data.csv"
bully_clean_data <- read.csv(file_path)
#### Test Data ####


# Check that num_of_searches are all numeric
bully_clean_data$num_of_searches |>
  class() == "numeric"

# Check that there are only three states in "us_state"
bully_clean_data$us_state |>
  unique() |>
  length() == 3

# Check that there are only three bully types in "bully_type"
bully_clean_data$bully_type |>
  unique() |>
  length() == 3

# Check that "num_of_searches" is no larger than 100 and no smaller than 0
bully_clean_data$num_of_searches |>
  max() <= 100
bully_clean_data$num_of_searches |>
  min() >= 0

# Check that class of "date" are all dates
bully_clean_data$date |>
  class() == "Date"
