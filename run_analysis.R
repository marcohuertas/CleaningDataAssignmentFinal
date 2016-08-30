# Script developed for the peer-reviewed assignment in course: Getting and Cleaning Data
#
#
#
#

# Import dplyr
library(dplyr)

# --- Collect data from the train set. ---
# - Read the subject id from file subject_train.txt
subjtrainoriginal <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subjectid")

# - Read the the activity file
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity")

# - Read the data with the measurements
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")

# - Read the features from file "features.txt"
features <- read.table("UCI HAR Dataset/features.txt")
# - Determine the columns of the data set feature that correspond to names including
# the term "mean" and "std"
meanstdcol <- which(grepl("mean|std",features$V2))
# - Remove "-" and "()" from names in features and create a list of descriptive variable
# names
featuresvarnames <- gsub("[-()]","",tolower(features[meanstdcol,"V2"]))

# - Subset the Xtrain data set using the columns from meanstdcol
Xmeanstdcoltrain <- Xtrain[,meanstdcol]
# - change the names of the columns using the vector featuresvarnames
names(Xmeanstdcoltrain) <- featuresvarnames

# - Create a vector of activities ordered as in file "activity_lablels.txt"
activlabels <- c("walking","walkingup","walkingdown","sitting","standing","laying")

# - Create a new data set by substituting the numbers in ytrain by the activity label
activtrain <- activlabels[ytrain$activity]

# Add two more columns to subjtrainoriginal:
#       1. subjectset: indicating that the subject belongs to the training set
#       2. activity: indicating the activity that the subject was involved in 
subjactivtrain <- mutate(subjtrainoriginal,"subjectset"="training","activity"=activtrain)

# - Combine Xmeanstdcol and subjactivtrain into one singe data set called cleantrain
cleantrain <- cbind(subjactivtrain,Xmeanstdcoltrain)

# ===== Repeat the same procedure for the data in folder test =====
# --- Collect data from the train set. ---

# - Read the subject id from file subject_test.txt
subjtestoriginal <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subjectid")
# - Read the the activity file
ytest <- read.table("UCI HAR Dataset/test/y_test.txt",col.names = "activity")
# - Read the data with the measurements
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
# - Subset the Xtest data set using the columns from meanstdcol
Xmeanstdcoltest <- Xtest[,meanstdcol]
# - change the names of the columns using the vector featuresvarnames
names(Xmeanstdcoltest) <- featuresvarnames
# - Create a new data set by substituting the numbers in ytest by the activity label
activtest <- activlabels[ytest$activity]
# - Add two more columns to subjtestoriginal:
#       1. subjectset: indicating that the subject belongs to the training set
#       2. activity: indicating the activity that the subject was involved in 
subjactivtest <- mutate(subjtestoriginal,"subjectset"="training","activity"=activtest)
# - Combine Xmeanstdcol and subjactivtest into one singe data set called cleantest
cleantest <- cbind(subjactivtest,Xmeanstdcoltest)

# === Final step ===
# - Combine data sets cleantrain and cleantest
# All data for train and test is combined in cleanexperimentdata
cleanexperimentdata <- rbind(cleantrain,cleantest)

# === Create a new data set with mean values of all measurements for each activity
# and subject

x <- cleanexperimentdata[,c("subjectid","activity",featuresvarnames)]
xmelt <- melt(x,id=c("subjectid","activity"),measure.vars = featuresvarnames)
tidydata <- dcast(xmelt,activity + subjectid ~ variable, mean)

# === Export the tidy data set as a text file
write.table(tidydata,file="tidydata.txt",row.names = F)


