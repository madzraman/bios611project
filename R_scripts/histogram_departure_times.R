library(tidyverse)
library(ggplot2)

#### Histogram of Departure Times

df <- read_csv("derived_data/df_original_cleaned.csv")
legend_colors <- c("Actual" = "black", "Scheduled" = "red")

hist_deptime <- ggplot(df) + 
  geom_histogram(aes(x=DepTime,y=after_stat(count)),color="black",fill='black', alpha=0.8) +
  geom_histogram(aes(x=CRSDepTime,y=after_stat(count)),color="tomato2",fill='tomato2', alpha=0.2) +
  labs(x='Time of day', y='Number of flights') +
  ggtitle("Distribution of Flights in 2022 by Departure Time", 
          subtitle="Black = Actual Departure Time, Red = Scheduled Departure Time") 

ggsave("figures/histogram_deptimes_sched_act.png", plot=hist_deptime)

#\n Red = Schedule Departure Time \n Black = Actual Departure Time"
