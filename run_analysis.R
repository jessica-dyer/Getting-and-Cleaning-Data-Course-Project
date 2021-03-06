#******************************************************************
#Step 0. Downloading dependencies
#******************************************************************
library(dplyr)

#******************************************************************
#Step 0. Downloading and unzipping dataset
#******************************************************************
if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/wearable.zip", method="curl")

zipF <- "./data/wearable.zip"
outDir <- "./data"
gwearable <- unzip(zipF, exdir = outDir)

#You should create one R script called run_analysis.R that does the following:

#******************************************************************
#Step 1.Merges the training and the test sets to create one data set
#******************************************************************

# 1.1 Read in column names
features <- read.table("data/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# 1.2  Reading training tables & assigning column names:
x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt", col.names = "code")

# 1.3 Reading test tables & assigning column names:  
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt", col.names = "code")

# 1.4 Merge all data into one dataset 
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

#******************************************************************
# 2.Extracts only the measurements on the mean and standard deviation for each measurement
#******************************************************************
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#******************************************************************
# 3.Uses descriptive activity names to name the activities in the data set
#******************************************************************
TidyData$code <- activities[TidyData$code, 2]

#******************************************************************
##4.Appropriately labels the data set with descriptive variable names
#******************************************************************
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

#******************************************************************
# 5.From the data set in step 4, create a second, independent tidy data set with the average of 
# each variable for each activity and each subject
#******************************************************************
# 5.1-5.2
FinalData <- TidyData %>%
group_by(subject, activity) %>%
summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
