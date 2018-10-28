#Coursera Data Science Program - Getting and Cleaning Data Course Project
##Assignment Instructions
Using data from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
do some merging and selecting of the tabular data to achieve a few rudimentary data manipulations and analyses.
##How the script works
The root data directory is assumed to be at the same level with the processing script, runAnalysis.R.
The script reads in the various data files and performs a merge of the training and test datasets using simple rbind() function.
The variable columns representing mean and standard deviation of the features are extracted from the provided data
and formed into a separate data frame. Then the mean of each column is taken within subsets for each person and activity. 
A new table is created with these mean values. The variable names are maintained in the table of means are very similar 
to the original variable names, but have 'AVG-' prepended to differentiate.
Libraries dplyr and stringr are used.
##Codebook
"person"    - which of the 30 test subjects original data set - mapped directly from original data set   
"activity"  - human-readable form of activity, mapped directly from original data set
*Below items are described accurately in codebook of original data set.*
*'AVG-' is prepended to indicate that the values represent averages*
*  of the sample points in the original data set.*            
"AVG-tBodyAcc-mean()-X"          
"AVG-tBodyAcc-mean()-Y"           "AVG-tBodyAcc-mean()-Z"           "AVG-tGravityAcc-mean()-X"       
"AVG-tGravityAcc-mean()-Y"        "AVG-tGravityAcc-mean()-Z"        "AVG-tBodyAccJerk-mean()-X"      
"AVG-tBodyAccJerk-mean()-Y"       "AVG-tBodyAccJerk-mean()-Z"       "AVG-tBodyGyro-mean()-X"         
"AVG-tBodyGyro-mean()-Y"          "AVG-tBodyGyro-mean()-Z"          "AVG-tBodyGyroJerk-mean()-X"     
"AVG-tBodyGyroJerk-mean()-Y"      "AVG-tBodyGyroJerk-mean()-Z"      "AVG-tBodyAccMag-mean()"         
"AVG-tGravityAccMag-mean()"       "AVG-tBodyAccJerkMag-mean()"      "AVG-tBodyGyroMag-mean()"        
"AVG-tBodyGyroJerkMag-mean()"     "AVG-fBodyAcc-mean()-X"           "AVG-fBodyAcc-mean()-Y"          
"AVG-fBodyAcc-mean()-Z"           "AVG-fBodyAccJerk-mean()-X"       "AVG-fBodyAccJerk-mean()-Y"      
"AVG-fBodyAccJerk-mean()-Z"       "AVG-fBodyGyro-mean()-X"          "AVG-fBodyGyro-mean()-Y"         
"AVG-fBodyGyro-mean()-Z"          "AVG-fBodyAccMag-mean()"          "AVG-fBodyBodyAccJerkMag-mean()" 
"AVG-fBodyBodyGyroMag-mean()"     "AVG-fBodyBodyGyroJerkMag-mean()" "AVG-tBodyAcc-std()-X"           
"AVG-tBodyAcc-std()-Y"            "AVG-tBodyAcc-std()-Z"            "AVG-tGravityAcc-std()-X"        
"AVG-tGravityAcc-std()-Y"         "AVG-tGravityAcc-std()-Z"         "AVG-tBodyAccJerk-std()-X"       
"AVG-tBodyAccJerk-std()-Y"        "AVG-tBodyAccJerk-std()-Z"        "AVG-tBodyGyro-std()-X"          
"AVG-tBodyGyro-std()-Y"           "AVG-tBodyGyro-std()-Z"           "AVG-tBodyGyroJerk-std()-X"      
"AVG-tBodyGyroJerk-std()-Y"       "AVG-tBodyGyroJerk-std()-Z"       "AVG-tBodyAccMag-std()"          
"AVG-tGravityAccMag-std()"        "AVG-tBodyAccJerkMag-std()"       "AVG-tBodyGyroMag-std()"         
"AVG-tBodyGyroJerkMag-std()"      "AVG-fBodyAcc-std()-X"            "AVG-fBodyAcc-std()-Y"           
"AVG-fBodyAcc-std()-Z"            "AVG-fBodyAccJerk-std()-X"        "AVG-fBodyAccJerk-std()-Y"       
"AVG-fBodyAccJerk-std()-Z"        "AVG-fBodyGyro-std()-X"           "AVG-fBodyGyro-std()-Y"          
"AVG-fBodyGyro-std()-Z"           "AVG-fBodyAccMag-std()"           "AVG-fBodyBodyAccJerkMag-std()"  
"AVG-fBodyBodyGyroMag-std()"      "AVG-fBodyBodyGyroJerkMag-std()" 