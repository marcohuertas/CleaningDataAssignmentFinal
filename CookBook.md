# Cook Book for data set tidy data

## Original Data Set
The original data set corresponds to the data from the “Human Activity Recognition Using Smartphones Dataset” from the study performed by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. from the Smartlab - Non Linear Complex Systems Laboratory (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

## Description of the experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Feature selection
The feature selection is described in the original data set in the file “features_info.txt”. The relevant information is reproduced here for its use in the data set “tidydata.txt”:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

From the set of variables that were estimated from these signals, the following will extracted to produce the final data set called “tidydata.txt”: 

* mean(): Mean value
* std(): Standard deviation
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Combining the train and test data 
The original data set consisted of two sets corresponding to the measurements and calculations obtained for two groups of subjects termed “train” and “test”. The data for these two groups was combined into a single data set by selecting only the variables in the original sets that corresponded to the mean and standard deviation of the observations.

In this regard, all variables corresponding to the various features with names containing the terms “mean”, “Mean” and “std” were collected from the data set in each group.

The format of the variables is the same as that in the original data set, except that all names are in lowercase letters and any underscore (“_”) or parenthesis (“()”) were removed.

For example the original variable “tBodyAcc-mean()-X” was transformed into “tbodyaccmeanx” in the new data set “tidydata.txt”

The meaning of these variables is described below.

## Constructing new data file “tidydata.txt”
The script run_analysis.R combines information contained in the original files:

* features.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt
* subject_test.txt

to produce a new summary data file called “tidydata.txt”. This file contains the summary data which consists of the mean value of the each feature extracted from the original data and organizes it by “activity” and “subject”.

As indicated in “Combining the train and test data”, the new variable names are taken from the original set except that its value represents the mean for each subject and activity:

For example: “tbodyaccmeanx” correspond to the mean value of “tBodyAcc-mean()-X”.

## Description of variables in “tidydata.txt”
The new data set “tidy data.txt” contains the following variables. Their description is taken from the description provided in the original set from the “Human Activity Recognition Using Smartphones Dataset”. 

Names of the variables are based on the description given in “Feature selection” section.

* _activity_: (character) Represents the activity performed by the subject. Takes the values “walking”, “walkingup” (representing walking upstairs), “walkingdown” (representing walking downstairs), “sitting”, “standing” and “laying”.

* *subjectid*: (integer) Identifies the subject. Takes the values from 1 to 30. 

* *tbodyaccmeanx*, *tbodyaccmeany*, *tbodyaccmeanz*: (numeric) Represent the mean value of the original variables “tBodyAcc-mean()-X”, “tBodyAcc-mean()-Y” and “tBodyAcc-mean()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tbodyaccstdx*, *tbodyaccstdy*, *tbodyaccstdz*: (numeric) Represent the mean value of the original variables “tBodyAcc-std()-X”, “tBodyAcc-std()-Y” and “tBodyAcc-std()-Z”, respectively.
Measured in units of g (Earth’s gravitational acceleration).

* *tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz*: (numeric) Represent the mean value of the original variables “tGravityAcc-mean()-X”, “tGravityAcc-mean()-Y” and “tGravityAcc-mean()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tgravityaccstdx, tgravityaccstdy, tgravityaccstdz*: (numeric) Represent the mean value of the original variables “tGravityAcc-std()-X”, “tGravityAcc-std()-Y” and “tGravityAcc-std()-Z”
, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tbodyaccjerkmeanx, tbodyaccjerkmeany, tbodyaccjerkmeanz*: (numeric) Represent the mean value of the original variables “tBodyAccJerk-mean()-X”, “tBodyAccJerk-mean()-Y” and “tBodyAccJerk-mean()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tbodyaccjerkstdx, tbodyaccjerkstdy, tbodyaccjerkstdz*: (numeric) Represent the mean value of the original variables “tBodyAccJerk-std()-X”, “tBodyAccJerk-std()-Y” and “tBodyAccJerk-std()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tbodygyromeanx, tbodygyromeany, tbodygyromeanz*: (numeric) Represent the mean value of the original variables “tBodyGyro-mean()-X”, “tBodyGyro-mean()-Y” and “tBodyGyro-mean()-Z”, respectively. Measured in units of radians/second.

* *tbodygyrostdx, tbodygyrostdy, tbodygyrostdz*: (numeric) Represent the mean value of the original variables “tBodyGyro-std()-X”, “tBodyGyro-std()-Y” and “tBodyGyro-std()-Z”, respectively. Measured in units of radians/second.

* *tbodygyrojerkmeanx, tbodygyrojerkmeany, tbodygyrojerkmeanz*: (numeric) Represent the mean value of the original variables “tBodyGyroJerk-mean()-X”, “tBodyGyroJerk-mean()-Y” and “tBodyGyroJerk-mean()-Z”, respectively. Measured in units of radians/second.

* *tbodygyrojerkstdx, tbodygyrojerkstdy, tbodygyrojerkstdz*: (numeric) Represent the mean value of the original variables “tBodyGyroJerk-std()-X”, “tBodyGyroJerk-std()-Y” and “tBodyGyroJerk-std()-Z”, respectively. Measured in units of radians/second.

* *tbodyaccmagmean, tbodyaccmagstd*: (numeric) Represent the mean value of the original variables “tBodyAccMag-mean()” and “tBodyAccMag-std()”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tgravityaccmagmean, tgravityaccmagstd*: (numeric) Represent the mean value of the original variables “tGravityAccMag-mean()” and “tGravityAccMag-std()”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tbodyaccjerkmagmean, tbodyaccjerkmagstd*: (numeric) Represent the mean value of the original variables “tBodyAccJerkMag-mean()” and “tBodyAccJerkMag-std()”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *tbodygyromagmean, tbodygyromagstd*: (numeric) Represent the mean value of the original variables “tBodyGyroMag-mean()” and “tBodyGyroMag-std()”, respectively. Measured in units of radians/second.

* *tbodygyrojerkmagmean, tbodygyrojerkmagstd*: (numeric) Represent the mean value of the original variables “tBodyGyroJerkMag-mean()” and “tBodyGyroJerkMag-std()”, respectively. Measured in units of radians/second.

* *fbodyaccmeanx, fbodyaccmeany, fbodyaccmeanz*: (numeric) Represent the mean value of the original variables “fBodyAcc-mean()-X”, “fBodyAcc-mean()-Y” and “fBodyAcc-mean()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *fbodyaccstdx, fbodyaccstdy, fbodyaccstdz*: (numeric) Represent the mean value of the original variables “fBodyAcc-std()-X”, “fBodyAcc-std()-Y” and “fBodyAcc-std()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *fbodyaccmeanfreqx, fbodyaccmeanfreqy, fbodyaccmeanfreqz*: (numeric) Represent the mean value of the original variables “fBodyAcc-meanFreq()-X”, “fBodyAcc-meanFreq()-Y” and “fBodyAcc-meanFreq()-Z”, respectively. Measured in units of Hz.

* *fbodyaccjerkmeanx, fbodyaccjerkmeany, fbodyaccjerkmeanz*: (numeric) Represent the mean value of the original variables “fBodyAccJerk-mean()-X”, “fBodyAccJerk-mean()-Y” and “fBodyAccJerk-mean()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *fbodyaccjerkstdx, fbodyaccjerkstdy, fbodyaccjerkstdz*: (numeric) Represent the mean value of the original variables “fBodyAccJerk-std()-X”, “fBodyAccJerk-std()-Y” and “fBodyAccJerk-std()-Z”, respectively. Measured in units of g (Earth’s gravitational acceleration). 

* *fbodyaccjerkmeanfreqx, fbodyaccjerkmeanfreqy, fbodyaccjerkmeanfreqz*: (numeric) Represent the mean value of the original variables “fBodyAccJerk-meanFreq()-X”, “fBodyAccJerk-meanFreq()-Y” and “fBodyAccJerk-meanFreq()-Z”, respectively. Measured in units of Hz.

* *fbodygyromeanx, fbodygyromeany, fbodygyromeanz*: (numeric) Represent the mean value of the original variables “fBodyGyro-mean()-X”, “fBodyGyro-mean()-Y” and “fBodyGyro-mean()-Z”, respectively. Measured in units of radians/second.

* *fbodygyrostdx, fbodygyrostdy, fbodygyrostdz*: (numeric) Represent the mean value of the original variables “fBodyGyro-std()-X”, “fBodyGyro-std()-Y” and “fBodyGyro-std()-Z”, respectively. Measured in units of radians/second.

* *fbodygyromeanfreqx, fbodygyromeanfreqy, fbodygyromeanfreqz*: (numeric) Represent the mean value of the original variables “fBodyGyro-meanFreq()-X”, “fBodyGyro-meanFreq()-Y” and “fBodyGyro-meanFreq()-Z”, respectively. Measured in units of Hz.

* *fbodyaccmagmean, fbodyaccmagstd*: (numeric) Represent the mean value of the original variables “fBodyAccMag-mean()” and “fBodyAccMag-std()”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *fbodyaccmagmeanfreq*: (numeric) Represent the mean value of the original variable “fBodyAccMag-meanFreq()”. Measured in units of Hz.

* *fbodybodyaccjerkmagmean, fbodybodyaccjerkmagstd*: (numeric) Represent the mean value of the original variables “fBodyBodyAccJerkMag-mean()” and “fBodyBodyAccJerkMag-std()”, respectively. Measured in units of g (Earth’s gravitational acceleration).

* *fbodybodyaccjerkmagmeanfreq*: (numeric) Represent the mean value of the original variable “fBodyBodyAccJerkMag-meanFreq()”. Measured in units of Hz.

* *fbodybodygyromagmean, fbodybodygyromagstd*: (numeric) Represent the mean value of the original variables “fBodyBodyGyroMag-mean()” and “fBodyBodyGyroMag-std()”, respectively. Measured in units of radians/second.

* *fbodybodygyromagmeanfreq*: (numeric) Represent the mean value of the original variable 539 “fBodyBodyGyroMag-meanFreq()”. Measured in units of Hz.

* *fbodybodygyrojerkmagmean, fbodybodygyrojerkmagstd*: (numeric) Represent the mean value of the original variables “fBodyBodyGyroJerkMag-mean()” and “fBodyBodyGyroJerkMag-std()”, respectively. Measured in units of radians/second.

* *fbodybodygyrojerkmagmeanfreq*: (numeric) Represent the mean value of the original variable “fBodyBodyGyroJerkMag-meanFreq()”. Measured in units of Hz.

