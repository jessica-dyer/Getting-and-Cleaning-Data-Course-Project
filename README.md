# Getting and cleaning data course project

**Dataset**  
- [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

***  

**Files**  
- **CodeBook.md** a code book that describes the variables, the data, and any transformations

- **run_analysis.R** downloads the data and follows the steps outlined in the course project as follows: 
  0. Download and unzip dataset into a /data folder in repository. Use gitignore to avoid github picking up the large dataset. 
  1. Merges the training and the test sets to create one data set 
    1. Read in column names
    1. Reading training tables & assigning column names
    1. Reading training tables & assigning column names
    1. Merge all data into one dataset
  2. Extracts only the measurements on the mean and standard deviation for each measurement
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names
  5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
    5.Create a second data set
    5.Write to a text file called "FinalData.txt"
    
- **Final.Data.txt**: final exported data product 
  
  