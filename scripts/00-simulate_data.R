#### Preamble ####
# Purpose: Simulates the school bullying and cyber bullying data of US
# Author: Mary Cheng, Yimiao Yuan, Shipeng Zhang
# Date: 11 February 2024
# Contact: yimiaomail@gmail.com
# License: --
# Pre-requisites: --
# Any other information needed? --


#### Workspace setup ####
# install required packages
# install.packages("tidyverse")

# load library
library(dplyr)
library(tidyr)
library(lubridate)


#### Simulate data ####

# Set seed for reproducibility
set.seed(238)

# Generate a US states
us_states <- c("US-LA")

# simulate monthly
bully_simulate_data <- 
  tibble(
    state = sample(us_states, 24, replace = TRUE),
    date = seq(from = as.Date("2022-01-01"), by = "month", length.out = 24),
    keyword = sample(c("bullying", "school_bully", "cyber_bully"), 24, replace = TRUE),
    num_searches = rpois(24, lambda = 50)
  )



