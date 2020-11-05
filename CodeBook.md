# Getting and Cleaning Data - peer assessment project

**The original data was transformed through the following steps:** 
-Downloading and extracting the required data  
-Merging the training and the test sets  
-Extracting only the measurements on the mean and standard deviation for each measurement  
-Using descriptive activity names to name the activities in the data set  
-Appropriately labeling the data set with descriptive activity names  
-Creating a second, independent data set with the mean of each variable for each activity and each subject  

**About R script**
-File with R code "run_analysis.R" performs the above tasks

**About variables:**
-x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files
-x_data, y_data and subject_data merge the previous datasets to further analysis
-features contains the correct names for the x_data dataset, which are applied to the column names for x_train & x_test