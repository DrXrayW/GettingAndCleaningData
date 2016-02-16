Getting and Cleaning Data Course Week 4 Project
========================================
There is only one script named run_analysis.R 

How run_analysis.R script works
* The script assumes that you have downloaded the file and unzipped https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The script assumes the unzipped data is put in the subdirectory 'UCI HAR Dataset' under the working directory.  
  If you put it under a different subdirectory, you may edit the root variable to point to the subdirectory you put the data in.
  
* There are two helper functions built to help read files from different locations. 
* The script will read data, do cleaning and merging, then output two files with tidy data, tidydata.txt and tidymeans.txt, to the working directory. 

* The script requires the dplyr package.  