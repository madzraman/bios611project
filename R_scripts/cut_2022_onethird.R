library(tidyverse)
library(gridExtra)
# Randomly sample 50% of the rows from each month since flights seem evenly distributed across months in 2022.
df_original <- read_csv("/Users/madhuriraman/Desktop/bios611/flight_delay_data/flight_delays_2022.csv")
df_new <- data.frame()

ff <- function(m, df){
  # get subset of data from that month
  df_m_third <- df %>% filter(., Month == m) %>% slice_sample(prop=1/3, replace=FALSE)
  # randomly sample 1/3 of the rows without replacement
  return (df_m_third)
}

for (mm in 1:12){
  df_mm <- ff(mm, df_original) #get 1/3 of the data for that month without replacement
  #add to new df
  df_new <- df_new %>% bind_rows(df_mm)
  
}

dim(df_original)
dim(df_new)

bp_flightcount_month_original <- ggplot(df_original) + 
  geom_bar(aes(x=factor(Month), y=after_stat(count)),fill='tomato2') +
  scale_x_discrete(labels=c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
                            'Aug', 'Sep', 'Oct', 'Nov', 'Dec')) +
  labs(title="Distribution of Flights in 2022 by Month", 
       x='Month', y='Number of flights')

bp_flightcount_month_new <- ggplot(df_new) + 
  geom_bar(aes(x=factor(Month), y=after_stat(count)),fill='tomato2') +
  scale_x_discrete(labels=c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
                            'Aug', 'Sep', 'Oct', 'Nov', 'Dec')) +
  labs(title="Distribution of Flights in 2022 by Month", 
       x='Month', y='Number of flights')

grid.arrange(bp_flightcount_month_original, bp_flightcount_month_new, ncol=2)


write_csv(df_new, "/Users/madhuriraman/Desktop/bios611/flight_delay_data/flight_delays_2022_onethird.csv")

# dfff <- read_csv("/Users/madhuriraman/Desktop/bios611/flight_delay_data/flight_delays_2022_onethird.csv")
# dim(dfff)
