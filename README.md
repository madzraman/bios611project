Hello! Welcome to my BIOS 611 Data Science Project. 

# Introduction

In this project, we will be investigating US flight delay data from 2022. This data was taken from Arvind Nagaonkar's larger Flight Delay dataset on Kaggle (https://www.kaggle.com/datasets/arvindnagaonkar/flight-delay/data), which contains flight data from the Bureau of Transportation Statistics from January 2018 - April 2023. However, due to the size of the whole data set (~6 GB), we choose to only look at a subset of data, flights from 2022, for this project. We chose data from 2022 as it is representative of a nearly back-to-normal post-pandemic world. Thus, the trends we find should be the most similar to present day and useful for future predictions. Note that we chose to further subset the 2022 flight data by randomly sampling one third of the data from every month to maintain the uniform distribution of flights month by month. This reduced the nearly 6 GB of data down to about 2 GB which was much more manageable to work with (for free) through Github Large File Storage (more details below). 

As mentioned by Arvind Nagaonkar on his Kaggle notebook, the dataset includes information about flights' scheduled and actual departure and arrival times. Note that this data set focuses on delayed flights, not cancelled or diverted flights. A detailed description of the columns can be found at the Kaggle link above.


## Git Large File Storage

Note that Git Large File Storage is required to build the source data. 


We assume that this project is being run from the top directory of this project, i.e. setwd("/home/rstudio/work").

## Clone the repo


## Docker Container

For this project, we utilize a tool called Docker to build an environment containing all of the necessary software for our project, including any R packages, Python libraries, and other dependencies.  


First run make clean!!!
Then do make report

