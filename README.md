## JHU Data Science Specialization

### Data Cleaning Course - Final Project

### Introduction

This repository contains the final project for the JHU data cleaning course. Following assignment instructions, it imports the UCI train/test data and cleans it into a tidy dataset. All steps are outlined below and noted in comments within the code.

### Instructions

The assignment instructions are listed below for reference, and the code is structured to match each step:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Solution

The code is structured in the steps below to clean the dataset as follows:

Step 1: Import Data
* a. Import text data files with read.table()
* b. Review dataset readme to identify how to merge data
* c. Label subject and activity columns before merging datasets
* d. Combine train/test data into single dataset with cbind()

Step 2: Extract Mean/Std Measurements
* a. Filter measurements with grep function
* b. Subset dataframe with column index based on filter results

Step 3: Label Activity Columns
* Replace activity labels by filtering on numeric value

Step 4: Replace Activity Labels
* Labels replaced with numeric index value, then mapped in code book file

Step 5: Aggregate Measurements
* a. Aggregate by subject and activity, then apply mean() function
* b. Output table to text file

### Conclusion

This project completes all steps as required and outputs a tidy dataset which meets the qualities as described in the class lecture. It was also a good learning opportunity in which I learned new data cleaning techniques in R.
