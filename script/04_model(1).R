# Load necessary libraries
library(tidyverse)
library(rstanarm)
library(modelsummary)

# Read the dataset from a CSV file
ces2020 <- read_csv("C:/Users/User/Desktop/Paper3/data_cleaned.csv")

# Rename the column 'support_biden' to 'vote_Biden'
ces2020 <- ces2020 %>% 
  rename(vote_Biden = support_biden)

# Convert the 'vote_Biden' variable into a factor
ces2020$vote_Biden <- factor(ces2020$vote_Biden, levels = c("No", "Yes"))

# Set seed for reproducibility
set.seed(321)

# Randomly sample 1000 observations to manage runtime
ces2020_reduced <- 
  ces2020 %>% 
  slice_sample(n = 1000)

# Fit the Bayesian logistic regression model
biden_preference_model <-
  stan_glm(
    vote_Biden ~ gender + race + age_group,  # Ensure variables are correctly named in your dataset
    data = ces2020_reduced,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 321
  )

# Save the model
saveRDS(
  biden_preference_model,
  file = "C:/Users/User/Desktop/Paper3/biden_preference_model.rds"
)


