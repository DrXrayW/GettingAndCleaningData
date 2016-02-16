# This script requires dplyr package (for the 2nd output)
library(dplyr)

# Function to get the file path to the data file by the filename without extension and subfolder
getFilePath = function(filename, subfolder = '') {
  #root dir, you may change this if it different in your environment
  root = './UCI HAR Dataset/'
  ext = '.txt'
  if(subfolder == '') {
    paste0(root, filename, ext)
  } else {
    paste0(root, subfolder, '/', filename, ext)
  }
}

# Function to read table by data name prefix ('X', 'y' or 'subject') and subsetname ('train' or 'test')
readtable = function(datanameprefix, subsetname) {
  read.table(getFilePath(paste0(datanameprefix, '_', subsetname), subsetname))
}

# Get merged data from train and test folder
getMergedData = function(datanameprefix) {
  rbind(readtable(datanameprefix, 'train'), readtable(datanameprefix, 'test'))
}

# Read merged data, label and subject
data = getMergedData('X')
label = getMergedData('y')
subject = getMergedData('subject')

# Read feature labels
features = read.table(getFilePath('features'))

# Extracts only the measurements on the mean and std 
selectedColumns = grep("mean\\(\\)|std\\(\\)", features[, 2])
data = data[, selectedColumns]

# Assign the feature labels to data and clean

names(data) = gsub("\\(\\)|-", "", tolower(features[selectedColumns, 2]))

# Read activity labels
activityLabel <- read.table(getFilePath('activity_labels'))
# Clean
activityLabel[, 2] = tolower(gsub("_", "", activityLabel[, 2]))

# Use the label number to locate the label and fill in the activity vector
label[,1] = activityLabel[label[,1],2] 
# Set its names
names(label) <- c('activity')
# And the names for subject
names(subject) <- c('subject')

# Bind everything together as tidy data
tidyData <- cbind(label, subject, data)
# write as output
write.table(tidyData, "tidydata.txt") 

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject 
# Using dplyr package
# Note that it is for each activity first, then for each subject
groups = group_by(tidyData, activity, subject)
tidymeans = summarize_each(groups, funs(mean))

#write 
write.table(tidymeans, "tidymeans.txt") 

