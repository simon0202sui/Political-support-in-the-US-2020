#### Preamble ####
# Purpose: Simulate data
# Author: Pengyu Sui, Lin Dai
# Date: 10 March 2024
# Contact: pengyu.sui@mail.utoronto.ca, dailin20000730@gmail.com
# License: MIT
# Prerequisites: none

## Work space set up ##
# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tibble)

# Set seed for reproducibility
set.seed(438)

# Define variables
races <- c('Black', 'White', 'Asian', 'Indian')
age_groups <- c('18-30', '31-61', '62-95')
genders <- c(1, 2) # 1 for male, 2 for female
support_options <- c('Yes', 'No')

# Simulate data with distinct support probabilities for different groups
n <- 1000 # Number of observations
simulated_data <- expand.grid(race = races, age_group = age_groups, gender = genders, rep = 1:(n/length(races)/length(age_groups)/length(genders)))
simulated_data$support_biden <- NA

# Assign probabilities based on group combinations
for (i in 1:nrow(simulated_data)) {
  # Conditions for race
  if (simulated_data$race[i] == 'Black') {
    prob_yes <- 0.9
  } else if (simulated_data$race[i] == 'White') {
    prob_yes <- 0.4
  } else if (simulated_data$race[i] == 'Asian') {
    prob_yes <- 0.7
  } else if (simulated_data$race[i] == 'Indian') {
    prob_yes <- 0.6
  }
  
# Adjust for age group
  if (simulated_data$age_group[i] == '18-30') {
    prob_yes <- prob_yes * 0.8 # Slightly less likely to support
  } else if (simulated_data$age_group[i] == '62-95') {
    prob_yes <- prob_yes * 1.5 # Slightly more likely to support
  }
  
# Adjust for gender
  if (simulated_data$gender[i] == 2) { # Assuming female are slightly more likely to support
    prob_yes <- prob_yes * 0.5
  }
  
# Ensure probabilities are within [0,1]
  prob_yes <- min(max(prob_yes, 0), 1)
  
# Assign support based on calculated probability
  simulated_data$support_biden[i] <- sample(support_options, 1, replace = TRUE, prob = c(prob_yes, 1-prob_yes))
}

simulated_data <- select(simulated_data, -rep)

# Visualization of Support for Biden by Race
ggplot(simulated_data, aes(x = race, fill = support_biden)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Race", x = "Race", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

# Visualization of Support for Biden by Age Group
ggplot(simulated_data, aes(x = age_group, fill = support_biden)) +
  geom_bar(position = "fill") + # Use "fill" to show proportions
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Age Group", x = "Age Group", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

# Visualization of Support for Biden by Gender
ggplot(simulated_data, aes(x = factor(gender, labels = c('Male', 'Female')), fill = support_biden)) +
  geom_bar(position = "fill") + # Use "fill" to show proportions
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Gender", x = "Gender", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 0, hjust = 0.5))

# Dowwnload CSV file
write.csv(simulated_data, "simulated_data.csv", row.names = FALSE)
