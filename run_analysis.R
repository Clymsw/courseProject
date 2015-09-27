 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function() {
     
     #load libraries     
     library(data.table)      #load data.table library
     library(reshape2)        #load reshape2 library
     library(dplyr)           #load dplyr library
     
     #set directory
     setwd("C:/Users/Gayathri Kulathumani/Desktop/1Gayathri/Data Science/course3")
     
     # y files = activities
     # x files = features
     
     #read x and y and subject test files
     xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
     ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
     subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

     #read x and y and subject train files
     xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
     ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
     subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
     
     # read activity labels
     activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
     
     # read column names
     features <- read.table("./UCI HAR Dataset/features.txt")[,2]
     
     # get mean and standard deviation for each measurement
     getfeatures <- grepl("mean|std", features)
     
     names(xtest) <- features
     
     # get mean and standard deviation for each measurement for test files
     xtest <- xtest[,getfeatures]
     
     # Load activity labels
     ytest[,2] <- activitylabels[ytest[,1]]
     names(ytest) <- c("ActivityID", "ActivityLabel")
     names(subjecttest) <- "subject"
     
     # cbind test data
     testdata <- cbind(as.data.table(subjecttest), ytest, xtest)
     
     names(xtrain) <- features
     
     # get mean and standard deviation for each measurement for train files
     xtrain <- xtrain[, getfeatures]
     
     # Load activity data
     ytrain[,2] <- activitylabels[ytrain[,1]]
     
     names(ytrain) <- c("ActivityID", "ActivityLabel")
     names(subjecttrain) <- "subject"
     
     # cbind train data
     traindata <- cbind(as.data.table(subjecttrain), ytrain, xtrain)
     
     # Merging test and train data
     mergeddata <- rbind(testdata, traindata)
     
     idlabels <- c("subject", "ActivityID", "ActivityLabel")
     datalabels <- setdiff(colnames(mergeddata), idlabels)
     meltdata <- melt(mergeddata, id = idlabels, measure.vars = datalabels)
     
     # Apply mean function to dataset using dcast function
     tidydata <- dcast(meltdata, subject + ActivityLabel ~ variable, mean)
     write.table(tidydata, file <- "./g3tidydata.txt", row.name=FALSE)

           
}