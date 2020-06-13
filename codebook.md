## JHU Data Science Specialization

### Data Cleaning Course - Final Project

### Codebook - Study Design

This codebook provides information on the following items per the week 1 lecture on the components of tidy data:

1. All variables, include ones not included in the tidy dataset
2. Information on summary choices in preparation of the dataset
3. Information on experiment design; in this case, data cleaning

### Section 1 - All Variables

The total dataset is based on the [UCI machine learning dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) which measures acceleration and velocity of 30 volunteers performing 6 motion-based activities. All variables are listed in the features.txt file which is included with the dataset.

Units for all variables are based in feet per second (ft/s) for velocity and feet per second^2 (ft/s^2) for acceleration since the dataset is developed by UCI which is a US-based institution and uses English units.

The features.txt file provides all variables by its abbreviated name, e.g. "tBodyAcc-mean()-X" with an index, so this codebook and tidy dataset follows this convention as follows:

1. Measurement units are assumed and not listed within tidy dataset to keep variable name length and documentation brief
2. Index is used to refer to variables within dataset
3. Codebook below follows same format as the features.txt file

### Section 2 - Summary Choices

The tidy dataset follows the assignment instructions and principles of this course as follows:

1. Dataset conforms to tidy dataset principles as covered in lecture
2. Data was cleaned following each step as outlined in the README
3. Subset and filter techniques were used to refine the dataset

In addition, the following design choices/assumptions were made during the data cleaning process:

1. Data was imported into dataframes for cleaning/exploration
2. Mean and standard deviation measurements were extracted using the grep function which was used to subset the variables
3. Activity labels were replaced by matching text strings, then replacing column names for each variable
4. Feature labels follow the same convention as the original dataset
5. Mean calculation was completed with the aggregate and mean/apply functions

### Section 3 - Study Design

This project is not a formal experimental study; however, it followed the principles for tidy data and data cleaning. It makes the same assumptions as those provided in the original dataset regarding the measurements/units.

The main files used to create the tidy dataset are the features.txt and main data files within the train/test folders of the original dataset. No attempt was made to alter the inertial signals data.

This [summary post](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) was cited in various discussion forum posts, so it was referenced to clarify any design decisions while preparing the dataset.

### Codebook - Tidy Dataset

Acceleration Measurements (Units: ft/s^2)
V1 tBodyAcc-mean()-X
V2 tBodyAcc-mean()-Y
V3 tBodyAcc-mean()-Z
V4 tBodyAcc-std()-X
V5 tBodyAcc-std()-Y
V6 tBodyAcc-std()-Z

Acceleration Measurements (Units: ft/s^2)
V41 tGravityAcc-mean()-X
V42 tGravityAcc-mean()-Y
V43 tGravityAcc-mean()-Z
V44 tGravityAcc-std()-X
V45 tGravityAcc-std()-Y
V46 tGravityAcc-std()-Z

Acceleration Measurements (Units: ft/s^2)
V81 tBodyAccJerk-mean()-X
V82 tBodyAccJerk-mean()-Y
V83 tBodyAccJerk-mean()-Z
V84 tBodyAccJerk-std()-X
V85 tBodyAccJerk-std()-Y
V86 tBodyAccJerk-std()-Z

Velocity Measurements (Units: ft/s)
V121 tBodyGyro-mean()-X
V122 tBodyGyro-mean()-Y
V123 tBodyGyro-mean()-Z
V124 tBodyGyro-std()-X
V125 tBodyGyro-std()-Y
V126 tBodyGyro-std()-Z

Velocity Measurements (Units: ft/s)
V161 tBodyGyroJerk-mean()-X
V162 tBodyGyroJerk-mean()-Y
V163 tBodyGyroJerk-mean()-Z
V164 tBodyGyroJerk-std()-X
V165 tBodyGyroJerk-std()-Y
V166 tBodyGyroJerk-std()-Z

Acceleration Measurements (Units: ft/s^2)
V201 tBodyAccMag-mean()
V202 tBodyAccMag-std()

Acceleration Measurements (Units: ft/s^2)
V214 tGravityAccMag-mean()
V215 tGravityAccMag-std()

Acceleration Measurements (Units: ft/s^2)
V227 tBodyAccJerkMag-mean()
V228 tBodyAccJerkMag-std()

Velocity Measurements (Units: ft/s)
V240 tBodyGyroMag-mean()
V241 tBodyGyroMag-std()

Velocity Measurements (Units: ft/s)
V253 tBodyGyroJerkMag-mean()
V254 tBodyGyroJerkMag-std()

Acceleration Measurements (Units: ft/s^2)
V266 fBodyAcc-mean()-X
V267 fBodyAcc-mean()-Y
V268 fBodyAcc-mean()-Z
V269 fBodyAcc-std()-X
V270 fBodyAcc-std()-Y
V271 fBodyAcc-std()-Z

Acceleration Measurements (Units: ft/s^2)
V294 fBodyAcc-meanFreq()-X
V295 fBodyAcc-meanFreq()-Y
V296 fBodyAcc-meanFreq()-Z

Acceleration Measurements (Units: ft/s^2)
V345 fBodyAccJerk-mean()-X
V346 fBodyAccJerk-mean()-Y
V347 fBodyAccJerk-mean()-Z
V348 fBodyAccJerk-std()-X
V349 fBodyAccJerk-std()-Y
V350 fBodyAccJerk-std()-Z

Acceleration Measurements (Units: ft/s^2)
V373 fBodyAccJerk-meanFreq()-X
V374 fBodyAccJerk-meanFreq()-Y
V375 fBodyAccJerk-meanFreq()-Z

Velocity Measurements (Units: ft/s)
V424 fBodyGyro-mean()-X
V425 fBodyGyro-mean()-Y
V426 fBodyGyro-mean()-Z
V427 fBodyGyro-std()-X
V428 fBodyGyro-std()-Y
V429 fBodyGyro-std()-Z

Velocity Measurements (Units: ft/s)
V452 fBodyGyro-meanFreq()-X
V453 fBodyGyro-meanFreq()-Y
V454 fBodyGyro-meanFreq()-Z

Acceleration Measurements (Units: ft/s^2)
V503 fBodyAccMag-mean()
V504 fBodyAccMag-std()

Acceleration Measurements (Units: ft/s^2)
V513 fBodyAccMag-meanFreq()
V516 fBodyBodyAccJerkMag-mean()
V517 fBodyBodyAccJerkMag-std()
V526 fBodyBodyAccJerkMag-meanFreq()

Velocity Measurements (Units: ft/s)
V529 fBodyBodyGyroMag-mean()
V530 fBodyBodyGyroMag-std()
V539 fBodyBodyGyroMag-meanFreq()
V542 fBodyBodyGyroJerkMag-mean()
V543 fBodyBodyGyroJerkMag-std()
V552 fBodyBodyGyroJerkMag-meanFreq()

Acceleration Measurements (Units: ft/s^2)
V555 angle(tBodyAccMean,gravity)
V556 angle(tBodyAccJerkMean),gravityMean)

Velocity Measurements (Units: ft/s)
V557 angle(tBodyGyroMean,gravityMean)
V558 angle(tBodyGyroJerkMean,gravityMean)
V559 angle(X,gravityMean)
V560 angle(Y,gravityMean)
V561 angle(Z,gravityMean)
