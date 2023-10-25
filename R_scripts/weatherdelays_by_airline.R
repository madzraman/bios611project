library(tidyverse)
library(ggplot2)

#### Bar plot of Weather Delays by Airline Code

df <- read_csv("derived_data/df_original_cleaned.csv")

# bar plot of departure delays by each airline code
bp_weatherdelay_airline <- ggplot(df) + 
  geom_bar(aes(x=fct_infreq(Marketing_Airline_Network), fill=sum(WeatherDelay))) +
  labs(title="Airlines with the most Weather Delay in 2022", 
       x='Airline', 
       y='total minutes of weather delay ') + 
  theme(legend.position="none")


ggsave("figures/weatherdelays_by_airline.png", plot=bp_weatherdelay_airline)

# The most flight delays due to weather (in terms of total minutes delayed) occur from American Airlines, Delta, and Southwest, which make sense because they are the most popular airlines and probably have the most flights to begin with. We should consider scaling this plot by the total number of flights, as this would be more meaningful for comparison. (Will do later)
