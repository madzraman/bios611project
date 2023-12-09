library(tidyverse)
library(ggcorrplot)
library(stats)
library(corrr)
df <- read_csv("derived_data/df_original_cleaned.csv")

df_numeric <- read_csv("derived_data/df_original_cleaned_numeric.csv")

df_numeric_tmp <- df_numeric[,1:25]
# Note that this data set contains duplicate columns, such as a time of the day 
# column split into two separate columns for the hours and minutes. Let's remove those for now.
corrmatrix <- round(cor(df_numeric_tmp),1)
ggcorrplot(corrmatrix, type = "lower", lab = TRUE)

