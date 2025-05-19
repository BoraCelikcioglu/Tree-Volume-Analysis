library (dplyr)
library(ggplot2)

# Check for NAs
if (any(is.na(trees))) {
  print("There are missing values.")
} else {
  print("There are no missing values.")
}

trees %>%
  filter(Volume > 15) %>%
  ggplot(aes(x = Height, y = Girth)) +
  geom_point() +
  labs(title = "Relationship between Height and Girth of Trees (Volume > 15)",
       x = "Height",
       y = "Girth")

# Histogram of tree volumes
ggplot(trees, aes(x = Volume)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Tree Volumes", x = "Volume")


# Adding a new column for calculated tree density using mutate()
trees <- trees %>%
  mutate(density = Volume/Height)

# Summarizing average girth for different heights using group_by() and summarise()
trees_summary <- trees %>%
  group_by(Height) %>%
  summarise(avg_girth = mean(Girth, na.rm = TRUE))
trees_summary
