
**Getting and Cleaning Data**
=============================

*Course Project*
------------------

This run_analysis.R program has a function run_analysis() which does the following:

**INTRODUCTION**

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**What is in this repository**

-run_analysis.R - R script that takes the raw data and gives a tidy data
-README.md - this file with info about the repo
-CodeBook.md - info about the given data and what to expect in return

**How to use this repo**

run_analysis.R is the main file. After compiling this file, run the file. This program contains a function that reads the following files:
-test/X_test.txt
-test/subject_test.txt
-test/y_test.txt
-train/X_train.txt
-train/subject_train.txt
-train/y_train.txt

These files should be present in a directory named  "UCI HAR Dataset" which is in the same directory as the run_analysis.R

The function will read and merge the data and will create a g3tidydata.txt file with tidy data


