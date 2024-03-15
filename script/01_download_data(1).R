#### Preamble ####
# Purpose: Download data
# Author: Pengyu Sui
# Date: 10 March 2024
# Contact: pengyu.sui@mail.utoronto.ca
# License: MIT
# Prerequisites: none

#### Workplace setup ####
library(tidyverse)

#### Load data ####
ces2022 <- read_csv("CES20_Common_OUTPUT.csv", show_col_types = FALSE)

# Save a New file
write_csv(ces2022, "ces2022.csv")
