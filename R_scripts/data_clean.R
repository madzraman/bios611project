library(tidyverse)
library(knitr)

df_original <- read_csv("source_data/flight_delays_2022_onethird.csv")

### Data cleaning check

# As a sanity check, let's first investigate the Time variables in our data to see if they make sense.
# 
# We need to ensure that departure time is always less than Arrival time. Let's see how many observations exist in our data for which this does NOT hold true, and what percentage of observations they represent. 

df_original <- df_original[,-ncol(df_original)]

sum(df_original$DepTime >= df_original$ArrTime)
sum(df_original$DepTime >= df_original$ArrTime)/nrow(df_original)



# About 4.5% of the observations have a departure time that is greater than the arrival time. Let's examine these further.



head(df_original[df_original$DepTime >= df_original$ArrTime, c("DepTime", "ArrTime")])
mean(df_original[df_original$DepTime >= df_original$ArrTime,]$DepTime)
mean(df_original[df_original$DepTime >= df_original$ArrTime,]$ArrTime)


# As a reminder, the departure and arrival times are formatted as "HHMM", i.e. hours and minutes. Note that since these are numeric data types, it does not make sense to add and subtract integers from them. By examining the sample of data above, at first glance it seems odd that there are arrival times with less than 4 digits. However, we then realize that the missing leading digits are simply ones, as the "HHMM" format is in military (24-hour) time. Thus, `610` really means `0610` like 6:10am, and `7` really means `0007` like 12:07am. Let us quickly verify that for all the "time" variables in "HHMM" format, i.e. `CRSDepTime`, `DepTime`, `CRSArrTime`, `ArrTime`, `WheelsOff`, and `WheelsOn`, that the "HH" part is always between 0 and 24 and that the "MM" part is always between 0 and 59. We do this below. We will also add these hours and minutes individually as columns in our dataframe for any future use.


df_new <- df_original %>% mutate(DepTime_Hours = (DepTime %/% 100), DepTime_Minutes = (DepTime %% 100),
                                 ArrTime_Hours = (ArrTime %/% 100), ArrTime_Minutes = (ArrTime %% 100),
                                 CRSDepTime_Hours = (CRSDepTime %/% 100), CRSDepTime_Minutes = (CRSDepTime %% 100),
                                 CRSArrTime_Hours = (CRSArrTime %/% 100), CRSArrTime_Minutes = (CRSArrTime %% 100),
                                 WheelsOff_Hours = (WheelsOff %/% 100), WheelsOff_Minutes = (WheelsOff %% 100),
                                 WheelsOn_Hours = (WheelsOn %/% 100), WheelsOn_Minutes = (WheelsOn %% 100))

validate_hours <- function(cv){
    # return number of INVALID ROWS based on hours being not between 0 and 24 inclusive
    return (sum(ifelse( 0 <= cv & cv <= 24, 0, 1))) # 1 for invalids, 0 for valids
}
validate_minutes <- function(cv){
    # return number of INVALID ROWS based on hours being not between 0 and 24 inclusive
    return (sum(ifelse( 0 <= cv & cv <= 59, 0, 1))) # 1 for invalids, 0 for valids
}

sum(validate_hours(df_new$DepTime_Hours), validate_hours(df_new$CRSDepTime_Hours), 
    validate_hours(df_new$ArrTime_Hours), validate_hours(df_new$CRSArrTime_Hours), 
    validate_hours(df_new$WheelsOff_Hours), validate_hours(df_new$WheelsOn_Hours))

sum(validate_minutes(df_new$DepTime_Minutes), validate_minutes(df_new$CRSDepTime_Minutes), 
    validate_minutes(df_new$ArrTime_Minutes), validate_minutes(df_new$CRSArrTime_Minutes), 
    validate_minutes(df_new$WheelsOff_Minutes), validate_minutes(df_new$WheelsOn_Minutes))


# The above sums being zero mean that all of our hours and minutes for all time variables are valid.

write_csv(df_new, "/home/rstudio/work/derived_data/df_original_cleaned.csv")

df_numeric <- df_new %>% select_if(is.numeric)

write_csv(df_numeric, "/home/rstudio/work/derived_data/df_original_cleaned_numeric.csv")



