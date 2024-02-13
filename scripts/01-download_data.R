#### Preamble ####
# Purpose: Downloads and saves the data from the Replication Package
# of the Paper "The COVID-19 Pandemic Disrupted Both School Bullying and Cyberbullying"
# Author: Mary Cheng, Yimiao Yuan, Shipeng Zhang
# Date: 11 February 2024
# Contact: yimiaomail@gmail.com
# License: --
# Pre-requisites: Download the Replication Package of the Paper through following url
# Paper available at: https://www.aeaweb.org/articles?id=10.1257/aeri.20210456


#### Workspace setup ####
# install required packages
# install.packages("tidyverse")

# load library
library(tidyverse)
library(opendatatoronto)


#### Load data ####
# the raw data is in the /data/ folder in the replication package
# change the file path to load the data into the project
bullying_file_path <- 
  "../inputs/data/2021_03_30_monthly_2012_2021_state_bullying_topic.csv"

bullying_raw <- read.csv(bullying_file_path)

cyberbully_file_path <-
  "../inputs/data/2021_03_30_monthly_2012_2021_state_cyb_bullying_topic.csv"

cyberbully_raw <- read.csv(cyberbully_file_path)

schbully_file_path <-
  "../inputs/data/2021_03_30_monthly_2012_2021_state_sch_bullying_topic.csv"

schbully_raw <- read.csv(schbully_file_path)


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(bullying_raw, "../inputs/data/bullying_raw_data.csv") 
write_csv(cyberbully_raw, "../inputs/data/cyberbully_raw_data.csv") 
write_csv(schbully_raw, "../inputs/data/schbully_raw_data.csv") 

