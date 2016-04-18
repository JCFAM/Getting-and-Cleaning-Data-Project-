
  
 # This R script does the following: 
 # 1. Merges the training and the test sets to create one data set. 
 
 
traindata <- read.table("train/X_train.txt") 
testdata <- read.table("test/X_test.txt") 
data <- rbind(traindata , testdata )  
 
subject_train <- read.table("train/subject_train.txt") 
subject_test <- read.table("test/subject_test.txt") 
subjects <- rbind(subject_train, subject_test) 
names(subjects) <- "subject"
 
labels_train <- read.table("train/y_train.txt") 
labels_test <- read.table("test/y_test.txt") 
labels <- rbind(labels_train, labels_test) 

 
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

 
features <- read.table("features.txt") 
indices_of_sel_features <- grep("mean\\(\\)|std\\(\\)", features[, 2]) 
data <- data[, indices_of_sel_features] 
names(data)<- features[indices_of_sel_features, 2] 
names(data) <- gsub("\\(|\\)", "", names(data)) 
names(data) <- tolower(names(data))  

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
labels[,1] = activities[labels[,1], 2]
names(labels) <- "activity"

#4.labels the data set with descriptive variable names. 

names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("acc", "accelerometer", names(data))
names(data)<-gsub("Gyro", "gyroscope", names(data))
names(data)<-gsub("Mag", "magnitude", names(data))


cleaned <- cbind(subjects, labels, data)


# 5.creates a second, independent tidy data set with the average of each variable for each activity and each subject.

aggr.data <- aggregate(cleaned[, 3:ncol(cleaned)],by=list(subject = cleaned$subject,activity = cleaned$activity),mean)
write.table(aggr.data, file = "tidydata.txt",row.name=FALSE)


 


