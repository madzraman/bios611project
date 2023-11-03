Hi, this is my 611 Data Science Project. 

In this project, we will be investigating US flight delay data from 2022. This data was taken from Arvind Nagaonkar's larger Flight Delay dataset on Kaggle (https://www.kaggle.com/datasets/arvindnagaonkar/flight-delay/data), which contains flight data from the Bureau of Transportation Statistics from January 2018 - April 2023. However, due to the size of the whole data set (~6 GB), we choose to only look at a subset of data, flights from 2022, for this project. We chose data from 2022 as it is representative of a nearly back-to-normal post-pandemic world. Thus, the trends we find should be the most similar to present day and useful for future predictions. We also chose to randomly sample one third of the data by month to maintain the uniform distribution of flights month by month. 

Specifically, our data set contains observations of flights in 2022. As mentioned by Arvind Nagaonkar on his Kaggle notebook, the data includes information about flights' scheduled and actual departure and arrival times. Note that this data set focuses on delayed flights, not cancelled or diverted flights. A detailed description of the columns can be found at the Kaggle link above.

We assume that this project is being run from the top directory of this project, i.e. setwd("/home/rstudio/work").

Note that Git Large File Storage is required to build the source data. 

TODO: Include notes about how this data originally came from Kaggle but then we cut it down to 2022 and then sampled one third of that uniformly by month.



