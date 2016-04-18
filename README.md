The cleanup script (run_analysis.R) does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Do the following:
1-Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
into a folder on your local drive, say C:\Users\yourname\Documents\R\
2-Put run_analysis.R to C:\Users\yourname\Documents\R\UCI HAR Dataset\
3-setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\")
and source("run_analysis.R")

