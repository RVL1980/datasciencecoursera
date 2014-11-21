## Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I performed to clean up the data.

* The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Please see the Readme.md file for instructions how to perform the analysis

### The run_analysis.R script performs the following steps to clean the data:

* The test and train sets were merged and the subject identifiers and activity labels were matched up to create a single data set with 1st column the subjects, 2nd column the activity labels and other columns the data. 
* Activity identifiers were converted to actual activity names. 
* Variables of each column were renamed to more readable ones
* Only the mean and standard deviation of each variable were kept for each subject and activity pair. There is a single row for each subject and activity pair, and a single column for each variable.

The final data set is in the Tidy_set_of_means.txt file, which can be read into R with read.table("Tidy_set_of_means.txt", header = TRUE). A detailed description of the variables can be found in CodeBook.md. The basic naming convention is:

"Mean {Time/Frequency}{measurement}{Mean/SD}{XYZ}"

Where Time/Frequency is either Time or Frequency, indicating whether the data comes from the time or frequency domain, measurement is one of the original measurements, Mean/SD is either Mean or standard deviation, and XYZ is X, Y, or Z, indicating the axis of measurement, or nothing, for magnitude measurements.
