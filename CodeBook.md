Getting and Cleaning Data Course Week 4 Project CodeBook
=================================================
The data was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The site describing the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      

Then the run_analysis.R script is executed to process data, which results in two result files: 'tidydata.txt' and 'tidymeans.txt'.  

* The script assumes that you have downloaded the file and unzipped https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The script assumes the unzipped data is put in the subdirectory 'UCI HAR Dataset' under the working directory.  
  If you put it under a different subdirectory, you may edit the root variable to point to the subdirectory you put the data in.
  
* The script requires the dplyr package.   
  
* The run_analysis.R script first reads and merges the /train/X_train.txt and /test/X_test.txt and saves in the data variable.
* Reads and merges the /train/y_train.txt and /test/y_test.txt and saves in the label variable.
* Reads and merges the /train/subject_train.txt and /test/subject_test.txt and saves in the subject variable.
* Reads the /features.txt in and saves in features variable

* Extracts the mean and std measurements. 

* Cleans column names: removing any () and - characters and turning all letters into lower cases. 
* Reads the /activity_labels.txt into the activityLabel variable
* Cleans the label texts, turning all letters into lower cases and remove all underscore characters. 

* Replaces the labels in the label data frame using the cleaned activity labels. 

* Assigns the names 'activity' and 'subject' to the columns for activity and subject in the activity data frame and the subject data frame.

* Binds the activity, subject and data data frames to produce the tidyData data frame.
* Writes tidyData to tidydata.txt as the first output.

* Makes a groups tbl by group_by{dplyr} from the tidyData grouping by the activity, then subject.
* Summarizes the groups tbl by using summarize_each {dplyr}, and saves in tidymeans. 

* Writes tidymeans to tidymeans.txt.  

