# JHU-DSCI Data Cleaning
# Assignment: Final Project
# Filename: run_analysis.R
# Name: Walter Yu
# Date: June 2020

# Note: This program is organized by instructions in chronological order:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Citations: Source below was referenced to help clarify assignment instructions
# https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

# step 1A: import text files with read.table()
# source: https://www.datacamp.com/community/tutorials/r-data-import-tutorial
train_subject <- read.table("train/subject_train.txt")
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
test_subject <- read.table("test/subject_test.txt")
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
features <- read.table("features.txt")

# step 1B: review dataset readme to identify how to merge data
dim(train_subject) # subject data
dim(train_x) # sensing data
dim(train_y) # labels

dim(test_subject) # subject data
dim(test_x) # sensing data
dim(test_y) # labels

# Note: label measurementss separately to filter mean/std later
dim(features) # labels
colnames(features) <- c("id", "value")
head(features[,2]) # verify colnames
print(c(features[,2])) # verify output

# step 1C: label columns before merging datasets
# Note: Measurement columns left to be labeled by index only
# source: https://stackoverflow.com/questions/7531868/how-to-rename-a-single-column-in-a-data-frame
colnames(train_subject) <- c("subject_id")
head(train_subject) # verify colnames
colnames(train_y) <- c("label_id")
head(train_y) # verify colnames

colnames(test_subject) <- c("subject_id")
head(test_subject) # verify colnames
colnames(test_y) <- c("label_id")
head(test_y) # verify colnames

# step 1D: combine train/test data into single dataset with cbind() 
# Note: merge data by column; cbind data by subject, labels/y and data/x
# source: https://stat.ethz.ch/R-manual/R-devel/library/base/html/cbind.html
df_train <- data.frame(cbind(train_subject, train_y, train_x))
dim(df_train) # verify that column count will line up between datasets
head(df_train)

df_test <- data.frame(cbind(test_subject, test_y, test_x))
dim(df_test) # verify that column count will line up between datasets
head(df_test)

# Note: Each record is organized by subject, activity and measurement
# rbind train/test data together per instructions
# source: https://stat.ethz.ch/R-manual/R-devel/library/base/html/cbind.html
df_total <- data.frame(rbind(df_train, df_test))
dim(df_total) # verify dim and colnames after rbind
colnames(df_total)

# step 2A: filter for only mean and standard deviation measurements 
# https://stackoverflow.com/questions/4220631/how-do-i-grep-in-r
df_features <- data.frame(features) # read in all measurement names

# filter measurement names by "mean", "Mean" and "std"
# source: https://stackoverflow.com/questions/7597559/grep-using-a-character-vector-with-multiple-patterns
match_mean <- df_features$id[grep("mean", df_features$value)]
match_mean_cap <- df_features$id[grep("Mean", df_features$value)]
match_std <- df_features$id[grep("std", df_features$value)]

# output list, then compile into column labels
match_mean
match_mean_cap
match_std
# df_match <- data.frame(rbind(match_mean, match_mean_cap, match_std))
# write.csv(df_match, 'grep_matches.csv')

# step 2B: subset by column index based on step 2A results
# source: https://stackoverflow.com/questions/45846341/how-to-subset-a-data-frame-column-wise-using-column-names
df_mean_std <- subset(df_total, select=c("subject_id","label_id","V1","V2","V3","V41","V42","V43","V81","V82","V83","V121","V122","V123","V161","V162","V163","V201","V214","V227","V240","V253","V266","V267","V268","V294","V295","V296","V345","V346","V347","V373","V374","V375","V424","V425","V426","V452","V453","V454","V503","V513","V516","V526","V529","V539","V542","V552","V4","V5","V6","V44","V45","V46","V84","V85","V86","V124","V125","V126","V164","V165","V166","V202","V215","V228","V241","V254","V269","V270","V271","V348","V349","V350","V427","V428","V429","V504","V517","V530","V543","V555","V556","V557","V558","V559","V560","V561"))
dim(df_mean_std) # verify dim, head and colnames are aligned within dataset
head(df_mean_std)
colnames(df_mean_std)

# step 3: replace activity labels per instructions as follows:
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

# source: https://stackoverflow.com/questions/11817371/replace-numbers-in-data-frame-column-in-r
df_mean_std$label_id[df_mean_std$label_id == 1] <- "WALKING"
df_mean_std$label_id[df_mean_std$label_id == 2] <- "WALKING_UPSTAIRS"
df_mean_std$label_id[df_mean_std$label_id == 3] <- "WALKING_DOWNSTAIRS"
df_mean_std$label_id[df_mean_std$label_id == 4] <- "SITTING"
df_mean_std$label_id[df_mean_std$label_id == 5] <- "STANDING"
df_mean_std$label_id[df_mean_std$label_id == 6] <- "LAYING"
df_mean_std$label_id

# step 4: replace activity labels
# Note: measurement column names left as index and mapped in code book

# step 5A: aggregate measurements by subject and activity
# source: https://stackoverflow.com/questions/34523679/aggregate-multiple-columns-at-once
tidy_data <- aggregate(.~subject_id+label_id, df_mean_std, mean)
head(tidy_data, n=200L) # verify head and dim after aggregate/grouping operation
dim(tidy_data)

# step 5B: output table to text file per instructions
# source: http://www.sthda.com/english/wiki/writing-data-from-r-to-txt-csv-files-r-base-functions
write.table(tidy_data, file="tidy_data.txt", sep="\t", row.names=FALSE)
