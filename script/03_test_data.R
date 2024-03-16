#### Preamble ####
# Purpose: Test data
# Author: Pengyu Sui, Lin Dai
# Date: 10 March 2024
# Contact: pengyu.sui@mail.utoronto.ca, dailin20000730@gmail.com
# License: MIT
# Prerequisites: none

#### Import data ####

# Load the cleaned survey data
cleaned_data_survey <- read_csv("C:/Users/User/Desktop/Paper3/data_cleaned.csv", show_col_types = FALSE)

# Check whether the survey data after cleaning is in line with expectations

# Define valid options for each categorical variable
valid_vote_intention <- c("Yes", "No", "Other")
valid_support_biden <- c("Yes", "No", "Other")
valid_party <- c("Democratic", "Republican", "Other")
valid_education <- c("No HS", "High school", "College", "Postgrad", "Other")
valid_race_ethnicity <- c("White", "Black", "American Indian", "Asian", "Other")
valid_age_group <- c("18-30", "31-61", "62-95")
valid_gender <- c("Female", "Male")

# Test each column for valid values
is_valid_vote_intention <- all(cleaned_data_survey$vote_intention %in% valid_vote_intention)
is_valid_support_biden <- all(cleaned_data_survey$support_biden %in% valid_support_biden)
is_valid_party <- all(cleaned_data_survey$party %in% valid_party)
is_valid_education <- all(cleaned_data_survey$education %in% valid_education)
is_valid_race <- all(cleaned_data_survey$race %in% valid_race_ethnicity)
is_valid_age_group <- all(cleaned_data_survey$age_group %in% valid_age_group)
is_valid_gender <- all(cleaned_data_survey$gender %in% valid_gender)

# Check for 'Unknown' values in each relevant column
no_unknown_values <- !any(cleaned_data_survey$vote_intention == "Unknown" |
                            cleaned_data_survey$support_biden == "Unknown" |
                            cleaned_data_survey$party == "Unknown" |
                            cleaned_data_survey$education == "Unknown" |
                            cleaned_data_survey$race == "Unknown" |
                            cleaned_data_survey$age_group == "Unknown" |
                            cleaned_data_survey$gender == "Unknown")

# Combine all validation checks
all_valid <- is_valid_vote_intention && is_valid_support_biden &&
  is_valid_party && is_valid_education && is_valid_race &&
  is_valid_age_group && is_valid_gender && no_unknown_values

# Print the result of the check
if (all_valid) {
  cat("All data checks passed. Data is clean and valid.\n")
} else {
  cat("There are issues with the data. Please review the cleaning process.\n")
  # Print specific issues
  if (!is_valid_vote_intention) cat("Invalid vote intention values found.\n")
  if (!is_valid_support_biden) cat("Invalid support Biden values found.\n")
  if (!is_valid_party) cat("Invalid party values found.\n")
  if (!is_valid_education) cat("Invalid education values found.\n")
  if (!is_valid_race) cat("Invalid race values found.\n")
  if (!is_valid_age_group) cat("Invalid age group values found.\n")
  if (!is_valid_gender) cat("Invalid gender values found.\n")
  if (!no_unknown_values) cat("Unknown values found in key columns.\n")
}
