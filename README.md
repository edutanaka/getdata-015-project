# Running the run_analysis.R

 1. Download the file and unzip ["UCI HAR Dataset"](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
 2. Download 'run_analysis.R' and save in UCI HAR Dataset directory
 3. Load run_analysis.R
 ``` 
 source("./run_analysis.R") 
 ```

# Codebook - variables

 trainSubject: data from "./train/subject_train.txt" containing subject information.

 trainX: data from "./train/X_train.txt". Training set information. 

 trainY: data from "./train/y_train.txt. Training labels information. 

 testSubject: data from "./test/subject_test.txt" containing subject information. 

 testX: data from "./test/X_test.txt". Test set information. 

 testY: data from "./test/y_test.txt". Test labels information. 

 features: data from "./features.txt". List of all features. 

 test: bindind test information from 'testSubject', 'testY' , and 'testX' variable. 

 train: binding training information from 'trainSubject', 'trainY' , and 'trainX' variable. 

 mergeddata: data table with merged data. 

 cols: filter features data that only has 'mean' and 'std' information 

 activities: data from "./activity_labels.txt" containing activity information 

 mergeddata$activity: a factor data based on 'activity_id' and 'activities' variables. 

 idlabels: vector with "subject", "activity_id", and "activity" data 

 datalabels: vector with 'idlabels' and rest of 'mergedata' column name 

 melteddata: melted data with id = idlabels and  measure.vars = datalabels 

 tidydata: data with mean result from 'melteddata' variable based in subject and activity 


