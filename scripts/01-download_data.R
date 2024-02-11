#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
bullying_file_path <- 
  "C:/Users/dell/Downloads/156901-V1/data/2021_03_30_monthly_2012_2021_state_bullying_topic.csv"

bullying_raw <- read.csv(bullying_file_path)

cyberbully_file_path <-
  "C:/Users/dell/Downloads/156901-V1/data/2021_03_30_monthly_2012_2021_state_cyb_bullying_topic.csv"

cyberbully_raw <- read.csv(cyberbully_file_path)



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
