library(tidyverse)
library(ggplot2)

#### Bar plot of Overall Delays by Departure City

df <- read_csv("derived_data/df_original_cleaned.csv")

# bar plot of departure delays by each departure city
total_bp_delay_depcity <- ggplot(df) + 
  geom_bar(aes(x = reorder(OriginCityName, -DepDelay), y = DepDelay, 
               fill = OriginCityName), stat = "identity") +
  labs(title="Departure Cities with the Most Flight Delay in 2022", 
       x='Departure City', 
       y='Flight Delay in Minutes') + 
  theme(legend.position="none")


total_bp_delay_depcity <- df %>%
  group_by(OriginCityName) %>%
  summarise(count = sum(!is.na(DepDelay))) %>%
  arrange(desc(count)) %>%
  mutate(OriginCityName = fct_reorder(OriginCityName, count)) %>%
  head(50) %>%
  ggplot(aes(x = count, y = OriginCityName)) +
  geom_bar(stat = "identity", fill="tomato2") +
  labs(x = "Departure Delay", y = "Departure City") +
  ggtitle("Top Departure Cities by Flight Delay")


ggsave("figures/total_bp_delay_depcity.png", plot=total_bp_delay_depcity)


