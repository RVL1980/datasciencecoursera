## Getting and Cleaning Data Course Project
This file describes how run_analysis.R script works.

* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "Data".
* Make sure the folder "Data" and the run_analysis.R script are both in the current working directory.
* Use source("run_analysis.R") command in R.
* Two output files are generated in the current working directory:

1) tidy_data.txt: This file contains a data frame called with dimensions of10299*68 
2) Tidy)set_of_means.txt: This file contains a data frame with 180*68 dimensions

* Use data <- read.table("tidy_set_of_means.txt") command in R to read the file. Only the mean and standard deviation of each variable were kept for each subject and activity pair. There is a single row for each subject and activity pair, and a single column for each variable. Therefore, since there are 6 activities in total and 30 subjects, we have 180 rows with all combinations for each of the 66 variables.