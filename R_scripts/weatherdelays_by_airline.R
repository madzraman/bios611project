library(tidyverse)
library(ggplot2)

#### Bar plot of Weather Delays by Airline Code

df <- read_csv("derived_data/df_original_cleaned.csv")

# bar plot of departure delays by each airline code
total_bp_weatherdelay_airline <- ggplot(df) + 
  geom_bar(aes(x=fct_infreq(Marketing_Airline_Network), fill=sum(WeatherDelay))) +
  labs(title="Airlines with the Most Weather Delay in Total in 2022", 
       x='Airline', 
       y='Total Minutes of Weather Delay') + 
  theme(legend.position="none")


ggsave("figures/total_weatherdelays_by_airline.png", plot=total_bp_weatherdelay_airline)

# The most flight delays due to weather (in terms of total minutes delayed) occur from American Airlines, Delta, and Southwest, which make sense because they are the most popular airlines and probably have the most flights to begin with. We should consider scaling this plot by the total number of flights, as this would be more meaningful for comparison. (Will do later)


# Now we scaled the plot of weather delays by airlines by the number of flights

# SCALED bar plot of departure delays by each airline code
# AVERAGE number of minutes of weather delay for each airline
# 
# df$Marketing_Airline_Network <- as.factor(df$Marketing_Airline_Network)
# average_bp_weatherdelay_airline <- ggplot(df) + 
#   geom_bar(aes(x=fct_infreq(Marketing_Airline_Network), fill=sum(WeatherDelay)/count(WeatherDelay))) +
#   labs(title="Airlines with the Most Weather Delay On Average in 2022", 
#        x='Airline', 
#        y='Average Minutes of Weather Delay') + 
#   theme(legend.position="none")
# 
# ggsave("figures/average_weatherdelays_by_airline.png", plot=average_bp_weatherdelay_airline)
