# COVID-19 Pandemic Influence on K1-12 Student Bullying Situation

## Overview

The study utilized Google Trend data to analyze the impact of COVID-19 on bullying patterns in the United States, revealing a significant decrease in searches related to bullying and cyberbullying during the shift to online learning in the spring of 2020.

## File Structure
│  .gitignore
│  .RData
│  .Rhistory
│  1.txt
│  2.txt
│  Covid-19-Analaysis.Rproj
│  LICENSE
│  README.md
│  
├─inputs
│  ├─data
│  │      2021_03_30_monthly_2012_2021_state_bullying_topic.csv
│  │      2021_03_30_monthly_2012_2021_state_cyb_bullying_topic.csv
│  │      2021_03_30_monthly_2012_2021_state_sch_bullying_topic.csv
│  │      bullying_raw_data.csv
│  │      cyberbully_raw_data.csv
│  │      schbully_raw_data.csv
│  │      US_LA_Population_2019.csv
│  │      US_LA_Population_2020.csv
│  │      US_NJ_Population_2019.csv
│  │      US_NJ_Population_2020.csv
│  │      US_NY_Population_2019.csv
│  │      US_NY_Population_2020.csv
│  │      
│  ├─literature
│  │      Alexander-ProjectOfStateLevel.pdf
│  │      
│  ├─llm
│  │      usage.txt
│  │      
│  └─sketches
│          simulate_dataset_and_graph.jpg
│          
├─outputs
│  │  paper.qmd
│  │  
│  ├─data
│  │      bully_clean_data.csv
│  │      LA_pop_2019_clean.csv
│  │      LA_pop_2020_clean.csv
│  │      NJ_pop_2019_clean.csv
│  │      NJ_pop_2020_clean.csv
│  │      NY_pop_2019_clean.csv
│  │      NY_pop_2020_clean.csv
│  │      pop_2019_clean.csv
│  │      pop_2019_comb.csv
│  │      pop_2020_clean.csv
│  │      pop_2020_comb.csv
│  │      state_ratios.csv
│  │      
│  ├─models
│  │      first_model.rds
│  │      
│  └─paper
│          paper.pdf
│          paper.qmd
│          references.bib
│          
└─scripts
        00-simulate_data.R
        01-download_data.R
        02-data_cleaning.R
        03-test_data.R
        04-model.R

## Data Source

The data set used in this analysis was obtained from the Google Tender and "The COVID-19 Pandemic Disrupted Both School Bullying and Cyberbullying". It includes information such as date, state, hits, and bully type.

## Installation

To run the analysis, you need R and the following R packages:

- janitor
- dplyr
- ggplot2
- tidyverse

You can install these packages using the following R code:

```{r}
install.packages(c("janitor", "dplyr", "ggplot2", "tidyverse"))
```
# Statement on LLM Usage

This project does not make use of any Language Model (LLM) in its analysis, code, or documentation.
