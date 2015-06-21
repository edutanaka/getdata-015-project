# 1. Merges the training and the test sets to create one data set.

# train tables
trainSubject <- read.table("./train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
trainX <- read.table("./train/X_train.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
trainY <- read.table("./train/y_train.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)

# test tables
testSubject <- read.table("./test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
testX <- read.table("./test/X_test.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
testY <- read.table("./test/y_test.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)

# features data
features <- read.table("./features.txt", header=FALSE, fill=TRUE, stringsAsFactors = FALSE)

# merge subject, set and label
test <- cbind(testSubject, testY,testX)
train <- cbind(trainSubject, trainY, trainX)

# merge test and train
mergeddata <- rbind(test, train)

# named variables using features table
colnames(mergeddata)[1:2] <- c("subject", "activity_id")
colnames(mergeddata)[3:length(test)] <- features[,2]

# 
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
library(dplyr)

# filter mean() and std() in features to discover column names with 'mean' and 'std(standard)'
cols <- filter(features, grepl('mean()|std()', V2) & !grepl('meanFreq', V2))[,2]
mergeddata <- mergeddata[, c("subject", "activity_id", cols)]


# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./activity_labels.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
mergeddata$activity <- factor(mergeddata$activity_id, levels = activities[,1],labels = activities[,2])

# 4. Appropriately labels the data set with descriptive variable names.
# done at line 23-25


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
idlabels   <- c("subject", "activity_id", "activity")
datalabels <-  setdiff(colnames(mergeddata), idlabels)
melteddata <- melt(mergeddata, id = idlabels, measure.vars = datalabels)
tidydata <- dcast(melteddata, subject + activity ~ variable, mean)

# export tidydata
write.table(tidydata, "./tidydata.txt", row.names = FALSE)
