
#Load work space
library(readr)
library(ggplot2)
library(patchwork)
cleaned_data_survey <- read_csv("outputs/clean_data/data_cleaned(1).csv")
simulated_data <- read_csv("outputs/clean_data/simulated_data.csv")

#Plot 1 combine (race)

plot1 <- ggplot(cleaned_data_survey, aes(x = race, fill = support_biden)) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Race", x = "Race", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

plot2 <- ggplot(simulated_data, aes(x = race, fill = support_biden)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Race", x = "Race", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

combined_plot1 <- plot1 + plot2
combined_plot1

#Plot 2 combine (age)

plot3 <- ggplot(cleaned_data_survey, aes(x = age_group, fill = support_biden)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Age Group", x = "Age Group", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

plot4 <- ggplot(simulated_data, aes(x = age_group, fill = support_biden)) +
  geom_bar(position = "fill") + # Use "fill" to show proportions
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Age Group", x = "Age Group", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

combined_plot2 <- plot3 + plot4
combined_plot2

#Plot 3 combine (gender)

plot5 <- ggplot(cleaned_data_survey, aes(x = gender, fill = support_biden)) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Gender", x = "Gender", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 0, hjust = 0.5))

plot6 <- ggplot(simulated_data, aes(x = factor(gender, labels = c('Male', 'Female')), fill = support_biden)) +
  geom_bar(position = "fill") + # Use "fill" to show proportions
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Gender", x = "Gender", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 0, hjust = 0.5))

combined_plot3 <- plot5 + plot6
combined_plot3






