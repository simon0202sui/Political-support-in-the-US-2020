#### Preamble ####
# Purpose: Tests the cleaned data
# Author: Lin Dai Pengyu Sui Xuecheng Gao
# Date: 9 March 2024
# Contact: dailin20000730@gmail.com

#### Workspace setup ####
library(readr)
library(tidyverse)
library(dplyr)

# Load survey data
survey_data <- read_csv("C:/Users/User/Desktop/Paper3/CES20_Common_OUTPUT.csv")

# Rename the variables
names(survey_data)[names(survey_data) == "CC20_364a"] <- "support_biden"
names(survey_data)[names(survey_data) == "educ"] <- "education"
names(survey_data)[names(survey_data) == "birthyr"] <- "age_group"
names(survey_data)[names(survey_data) == "CC20_363"] <- "vote_intention"
names(survey_data)[names(survey_data) == "CC20_360"] <- "party"

# Cleaning and modifying data: including gender categorization
cleaned_data_survey <- survey_data %>%
  select(vote_intention, support_biden, party, education, race, age_group, gender) %>%
  mutate(
    vote_intention = case_when(
      vote_intention == 1 ~ "Yes",
      vote_intention == 2 ~ "No",
      vote_intention == 3 | vote_intention == 999 ~ "Other",
      TRUE ~ "Unknown"
    ),
    support_biden = case_when(
      support_biden == 1 ~ "No",
      support_biden == 2 ~ "Yes",
      support_biden == 999 ~ "Other",
      TRUE ~ "Unknown"
    ),
    party = case_when(
      party == 2 ~ "Democratic",
      party == 3 ~ "Republican",
      party == 1 | party == 999 ~ "Other",
      TRUE ~ "Unknown"
    ),
    education = case_when(
      education == 1 ~ "No HS",
      education == 2 ~ "High school",
      education == 3 ~ "College",
      education == 6 ~ "Postgrad", # Corrected from "Post grad" to "Postgrad" to match valid options
      education == 999 ~ "Other",
      TRUE ~ "Other"
    ),
    race = case_when(
      race == 1 ~ "White",
      race == 2 ~ "Black",
      race == 3 ~ "American Indian",
      race == 4 ~ "Asian",
      race == 999 ~ "Other",
      TRUE ~ "Unknown"
    ),
    age_group = case_when(
      age_group >= 1990 & age_group <= 2002 ~ "18-30",
      age_group >= 1959 & age_group <= 1989 ~ "31-61",
      age_group >= 1925 & age_group <= 1958 ~ "62-95",
      TRUE ~ "Unknown"
    ),
    gender = case_when(
      gender == 1 ~ "Male",
      gender == 2 ~ "Female",
      TRUE ~ "Unknown"
    )
  ) %>%
  filter(!if_any(c(vote_intention, support_biden, party, education, race, age_group, gender), ~ .x == "Unknown"))

# Save the cleaned data
write_csv(cleaned_data_survey, "C:/Users/User/Desktop/Paper3/data_cleaned.csv")