##
## Data Science 
## Johns Hopkins School of Public Health
## Coursera
##
## Getting and Cleaning Data course Project
##
## This script reads human body activity metric data from a database provided by UCI
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## and creates two primary outputs as requested in the project assignment:
## 1. train_and_test -- a dataframe of the merged original separate traing and test datasets
## 2. mean_tbl -- an average of the mean() and std() variables from original dataset
##                subsetted by person and activity
##

library(dplyr)
library(stringr)

# Read the data files
activity_train = read.table("UCI HAR Dataset\\train\\y_train.txt")
person_train   = read.table("UCI HAR Dataset\\train\\subject_train.txt")
features_train = read.table("UCI HAR Dataset\\train\\X_train.txt")
activity_test  = read.table("UCI HAR Dataset\\test\\y_test.txt")
person_test    = read.table("UCI HAR Dataset\\test\\subject_test.txt")
features_test  = read.table("UCI HAR Dataset\\test\\X_test.txt")

# Read feature descriptions
feature_desc = read.table("UCI HAR Dataset\\features.txt",stringsAsFactors=F)
activity_desc = read.table("UCI HAR Dataset\\activity_labels.txt",stringsAsFactors=F)

# Create data frames with variable names
train_ds = cbind(person_test, activity_desc$V2[activity_test$V1], rep("test", length(activity_test$V1)), features_test)
names(train_ds) = c("person","activity","dataset",feature_desc$V2)

test_ds = cbind(person_train, activity_desc$V2[activity_train$V1], rep("train", length(activity_train$V1)), features_train)
names(test_ds) = c("person","activity","dataset",feature_desc$V2)

# uncomment these lines to free-up memory
# rm(list=ls()[grep("test$",ls())])
# rm(list=ls()[grep("train$",ls())])
# rm("feature_desc")

# merge trainig and test datasets
train_and_test = rbind(train_ds, test_ds)

# uncomment this line to free-up memory
# rm(train_ds, test_ds)

# Find columns representing mean() and std() data
mean_cols = grep("mean\\(\\)", names(train_and_test))
std_cols = grep("std\\(\\)", names(train_and_test))

# create new data frame with only mean()a dn std() data
mean_and_std = cbind(person=train_and_test$person, activity=train_and_test$activity, dataset=train_and_test$dataset, train_and_test[,mean_cols], train_and_test[,std_cols])

r = NULL

# Loop over person and activity, build up table representing mean of mean() and std() variables
# There may be a more clever way to do this without for-loops, but I couldn't find it
for (p in unique(mean_and_std$person)) {
   for (act in unique(mean_and_std$activity)) {
      # get ony rows corresponding to this person and this activity
      v = filter(mean_and_std, person==p, activity==act)
      q = colMeans(subset(v, select=-c(person,activity,dataset)))
      
      # modify variable names since we're changing the data definition
      varnames = paste0("AVG-",attr(q,"names"))
      
      # reshape the data to wide format
      c = matrix(q,1,length(q),dimnames=list("",varnames))
      df = data.frame(c,check.names=FALSE,stringsAsFactors=FALSE)
      
      # prepend person and activity labels
      df = cbind("person"=p, "activity"=act, df)
      r = rbind(r, df)
   }
}

# order the output table so it looks better
mean_tbl = arrange(r, person, activity)
