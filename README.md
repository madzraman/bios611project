Hello! Welcome to my BIOS 611 Data Science Project. 

# Introduction

In this project, we will be investigating U.S. flight delay data from 2022. This data was taken from Arvind Nagaonkar's larger Flight Delay dataset on Kaggle (https://www.kaggle.com/datasets/arvindnagaonkar/flight-delay/data), which contains flight data from the Bureau of Transportation Statistics from January 2018 - April 2023. However, due to the size of the whole data set (~6 GB), we choose to only look at a subset of data, flights from 2022, for this project. We chose data from 2022 as it is representative of a nearly back-to-normal post-pandemic world. Thus, the trends we find should be the most similar to present day and useful for future predictions. 

We chose to further subset the 2022 flight data by randomly sampling one third of the data from every month to maintain the uniform distribution of flights month by month. This reduced the nearly 6 GB of data down to about 2 GB which was much more manageable to work with (for free) through Github Large File Storage (more details below). Note that the script that cuts the full 2022 data set down to one third of the size is included in this repo in 'R_scripts/cut_2022_onethird.R' for reference, but it is not a functional script in the context of this repo. The data contained in the `source_data` directory is already one-third of 2022 data, and is worked with directly for all other scripts used to create the final report.

As mentioned by Arvind Nagaonkar on his Kaggle notebook, the dataset includes information about flights' scheduled and actual departure and arrival times. Note that this data set focuses on delayed flights, not cancelled or diverted flights. A detailed description of the columns can be found at the Kaggle link above.

# Steps to Run this Project (and create report)

## 1. Clone the Repository

The first step is to clone this repository to whichever directory you want to work in. Once you are in the desired directory, run the following lines:

```
git clone https://github.com/madzraman/bios611project
cd bios611project
```

## 2. Build the Docker Container

For this project, we utilize a tool called Docker to build an environment containing all of the necessary software for our project, including any R packages, Python libraries, and other dependencies. After running the above lines of code, the next step is to build the Docker container for this project, which is based on the Dockerfile contained in the repository. Simply run the following line of code to build the project Docker container.  

```
docker build . --build-arg USER_ID=$(id -u) -t 611
```

### A note about Git Large File Storage

Because our source data is larger than 100 MB but less than 2 GB, we use Git Large File Storage to upload our data to the Github repo. To install Git-LFS, the following lines have already been added to our Dockerfile, so no action is required by the end user other than building the Docker container as usual. 

```
# Add Git and Git LFS repositories and install them
RUN add-apt-repository ppa:git-core/ppa && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get update && \
    apt-get install -y git git-lfs
```

As an aside, note that anytime you are pushing code to Github for this project, it is necessary to add:

```
git add .gitattributes
``` 

For more information about Git-LFS, see https://git-lfs.com.

## 3. Run the Docker Container and Open RStudio

After building the Docker container, the next step is to actually run the container and then launch RStudio. To do this (for Linux and Mac users), run the following:

```
docker run --rm -v $(pwd):/home/rstudio/work -e PASSWORD=flightdelay611 -p 8787:8787 -it project
```

Then, make sure that the port 8787:8787 is open so that you can launch the RStudio server by visiting http://localhost:8787 in your local web browser and signing in with username: rstudio, password: flightdelay611. 

## 4. Build Project and Make Report

The rest of this project will be run in the RStudio server.

At this point, we will assume that all code is being run from the top directory of this project. To ensure this, run the following line of code in the R console of your RStudio Server:

```
setwd("/home/rstudio/work")
```

Note that this project is completely organized in the Makefile, which is organized by the different tasks performed. The final report contains all figures and analysis done in the project with detailed discussion. To build the final report, simple run in the RStudio server terminal:

```
make report
```

This command will first run the phony target of `make clean` and create a clean folder with only scripts and source data. If desired, you are welcome to run `make clean` separately first. Then, `make report` will make each individual step in the Makefile and ultimately output an html file called `report.html`. Again, you are welcome to make each individual make target separately. Open `report.html` in a web browser to view the final project report.

