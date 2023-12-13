library(tidyverse)
library(ggcorrplot)


df_numeric <- read_csv("derived_data/df_original_cleaned_numeric.csv")

df_delaytypes <- df_numeric[,c("CarrierDelay","WeatherDelay","NASDelay","SecurityDelay", "LateAircraftDelay")]

# Assuming 'df_delaytypes' is your data frame
cp <- ggcorrplot(
  cor(df_delaytypes),
  title = "Delay Type Correlation Matrix",
  method = "square",      # Visualization method ("circle", "square", "number", etc.)
  type = "lower",         # Display lower part of the correlation matrix
  colors = c("blue", "white", "red"),  # Diverging color palette
  lab = TRUE,             # Display labels
  outline.col = "black",  # Color of the correlation circle
  ggtheme = theme_minimal(),  # Choose a ggplot2 theme
  hc.order = TRUE,        # Apply hierarchical clustering
  hc.method = "complete"  # Hierarchical clustering method
)


ggsave("figures/delaytypes_corr_matrix.png", plot = cp, width = 10, height = 8, units = "in", dpi = 300)

