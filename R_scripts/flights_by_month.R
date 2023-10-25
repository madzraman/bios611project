library(tidyverse)
library(ggplot2)
#### Barplot of flights in 2022 by Month

df <- read_csv("derived_data/df_original_cleaned.csv")

bp_flightcount_month <- ggplot(df) + 
  geom_bar(aes(x=factor(Month), y=after_stat(count)),fill='tomato2') +
  scale_x_discrete(labels=c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
                            'Aug', 'Sep', 'Oct', 'Nov', 'Dec')) +
  labs(title="Distribution of Flights in 2022 by Month", 
       x='Month', y='Number of flights')


ggsave("figures/flightcount_by_month.png", plot=bp_flightcount_month)

# We see that the distribution of flights in our data set is relatively uniform across 2022. 
# There is a slight increase in flights in the summer months compare to the winter months, 
# with July 2022 having the most flights and February 2022 having the least. This seems 
# sensible due to the cold weather in February (in most of the country). Additionally, most 
# kids are on summer vacation in July so we expect vacations to be quite common that month.
