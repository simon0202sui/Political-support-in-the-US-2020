#load work space
cleaned_data_survey <- read.csv("outputs/clean_data/data_cleaned(1).csv")

# Visualization 1: Support for Biden Trend by Age Group
ggplot(cleaned_data_survey, aes(x = age_group, y = ..count.., group = support_biden, color = support_biden)) +
  geom_line(stat = "count") +
  labs(title = "Support for Biden Trend by Age Group", x = "Age Group", y = "Count", color = "Support for Biden") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

# Visualization: Support for Biden Trend by Education Level
ggplot(cleaned_data_survey, aes(x = education, fill = support_biden)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden Trend by Education Level", x = "Education Level", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(cleaned_data_survey, aes(x = education, y = support_biden, fill = support_biden)) +
  geom_jitter(position = position_jitter(width = 0.2), size = 3) +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden Trend by Education Level", x = "Education Level", y = "Support for Biden") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))


# Visualization: Support for Biden by Race
ggplot(cleaned_data_survey, aes(x = race, fill = support_biden)) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Race", x = "Race", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(cleaned_data_survey, aes(x = race, y = support_biden, fill = support_biden)) +
  geom_jitter(position = position_jitter(width = 0.2), size = 3, color = "black") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Race", x = "Race", y = "Support for Biden") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))


# Visualization: Support for Biden by Gender
ggplot(cleaned_data_survey, aes(x = gender, fill = support_biden)) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Gender", x = "Gender", y = "Proportion of Support") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 0, hjust = 0.5))

ggplot(cleaned_data_survey, aes(x = gender, y = support_biden, fill = support_biden)) +
  geom_jitter(position = position_jitter(width = 0.2), size = 3, color = "black") +
  scale_fill_manual(values = c('Yes' = 'blue', 'No' = 'red')) +
  labs(title = "Support for Biden by Gender", x = "Gender", y = "Support for Biden") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))



