# CleaningDataAssignmentFinal
Files for project in course Getting and Cleaning Data

## Code run_analysis.R
This code uses the data from the Human Activity Recognition Using Smartphones Dataset. It combines the data of the training and test sets, pulling only the mean and standard deviation data from these sets. It produces an new data set called “tidydata.txt” that summarizes the combined data by providing the mean of all features extracted from the original data organized by subject and activity.

## How to run it
The script assumes that the following files are in the working directory:

* features.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt
* subject_test.txt

To run the script type 
source(‘run_analysis.R’)

The script will produce an output file called “tidydata.txt” that contains the mean of all observations per subject and activity.

