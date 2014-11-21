## Read in subject identfiers from train and test data-sets, merge
## and label the column appropriately
train_subjects <- read.table("Data/train/subject_train.txt")
test_subjects <- read.table("Data/test/subject_test.txt")
merged_subjects<-rbind(train_subjects,test_subjects) ## dim 10299x1
names(merged_subjects)<-"Subjects"

## Read in the activity identifiers from train and test data-sets
## and merge them
train_labels <- read.table("Data/train/y_train.txt")
test_labels  <- read.table("Data/test/y_test.txt")
merged_labels<-rbind(train_labels,test_labels) ## dim 10299x1

## PART 1: Merge traning with test data
## -----------------------------------
## Read in train and test data and merge
train_data <- read.table("Data/train/X_train.txt")
test_data  <- read.table("Data/test/X_test.txt")
merged_data <- rbind(train_data,test_data) ## dim 10299x561

## PART 2: Extracts only the measurements on the mean and 
## standard deviation for each measurement
## ------------------------------------------------------
## Read variable labels
labels <- read.table("Data/features.txt")
## Use variable names as column names in the merged data file
names(merged_data)<-labels[,2]
## Search for column names that have mean( or std( in them and
## save their indices
meanstd_index <- grep("(mean|std)\\(", names(merged_data))
## Only keep the columns of variables with mean and std
short_data <- merged_data[, meanstd_index] ## dim 10299x66

## PART 3: Use descriptive activity names to name the 
## activities in the data set
## ------------------------------------------------------
## Read activity labels (walking, standing etc.)
activity <- read.table("Data/activity_labels.txt")
## Convert to lower-case, remove underscores
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
## Capitalize approriate first letters of each word
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
substr(activity[, 2], 1, 1) <- toupper(substr(activity[, 2], 1, 1))
## Save only the activity names
activity_names<-activity[,2]
## Create 10299x1 column with activity string matched to number identifier
## in merged_labels
activity_labels <- activity_names[merged_labels[,1]]
## Replace number identifier with matching activity name
merged_labels[,1]<-activity_labels
## Give appropriate name to Activity column
names(merged_labels)<-"Activity"

## PART 4: Appropriately label the data set with descriptive 
## variable names 
## ------------------------------------------------------
## Remove brackets, replace 't' with Time, replace 'f' with Frequency
## replace 'mean' with Mean, replace 'std' with SD, remove underscores
## and replace 'BodyBody' with Body
names(short_data) <- gsub("\\(\\)", "", labels[meanstd_index, 2]) 
names(short_data) <- gsub("^t", "Time", names(short_data))
names(short_data) <- gsub("^f", "Frequency", names(short_data))
names(short_data) <- gsub("mean", "Mean", names(short_data))
names(short_data) <- gsub("std", "SD", names(short_data)) 
names(short_data) <- gsub("-", "", names(short_data))  
names(short_data) <- gsub("BodyBody", "Body", names(short_data))
## Append variable columns to Subjects and Activity labels
## and write to file
tidy_data <- cbind(merged_subjects, merged_labels, short_data)
write.table(tidy_data, "tidy_data.txt")

## PART 5: From the data set in step 4, create a second, independent 
## tidy data set with the average of each variable for each 
## activity and each subject.
## ------------------------------------------------------

## Create function DataMeans to calculate column means of all but 
## first 2 columns
DataMeans <- function(data) { colMeans(data[,-c(1,2)]) }
## Load plyr library
library(plyr)
## Use function DataMeans to calculate the column means of 
## data frame split by Subjects and Activity
Tidy_set_of_means <- ddply(tidy_data, .(Subjects, Activity), DataMeans)
## Change column names to reflect that they are means
names(Tidy_set_of_means)[-c(1,2)] <- paste("Mean", names(Tidy_set_of_means)[-c(1,2)], sep=" ")
## Write data set to file
write.table(Tidy_set_of_means, "Tidy_set_of_means.txt", row.names = FALSE)