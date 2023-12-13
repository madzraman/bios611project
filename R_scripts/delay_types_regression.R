library(tidyverse)

df_numeric <- read_csv("derived_data/df_original_cleaned_numeric.csv")

df_delaytypes <- df_numeric[,c("DepDelay", "CarrierDelay","WeatherDelay",
                               "NASDelay","SecurityDelay", "LateAircraftDelay")]

summary(df_delaytypes)


lm.out <- lm(DepDelay ~ CarrierDelay + WeatherDelay + NASDelay + SecurityDelay + LateAircraftDelay, 
             data=df_delaytypes)

# Extract relevant information from the summary
summary_info <- summary(lm.out)

# Create a data frame with coefficients and residuals
output_lmdata <- data.frame(
  Coefficient = coef(lm.out),
  Std_Error = summary_info$coefficients[, "Std. Error"],
  t_value = summary_info$coefficients[, "t value"],
  P_Values = summary_info$coefficients[, "Pr(>|t|)"]
)

# Save the data frame to a CSV file
write.csv(output_lmdata, "derived_data/linear_regression_output.csv", row.names = FALSE)

