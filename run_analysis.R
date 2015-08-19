## Using the dplyr library
library(dplyr)
## Setting the data path variables
dataSetPath <- "./UCI HAR Dataset"
trainingFolder <- "train"
testFolder <- "test"

## Reading data
## Reading training dataset
trainingSetFile <- paste(dataSetPath, trainingFolder, "X_train.txt", sep = "/")
trainingSet <- read.table(trainingSetFile)

## Reading training labels
trainingLabelsFile <- paste(dataSetPath, trainingFolder, "y_train.txt", sep = "/")
trainingLabels <- read.table(trainingLabelsFile)

## Reading training subjects
trainingSubjectsFile <- paste(dataSetPath, trainingFolder, "subject_train.txt", sep = "/")
trainingSubjects <- read.table(trainingSubjectsFile)


## Reading test dataset
testSetFile <- paste(dataSetPath, testFolder, "X_test.txt", sep = "/")
testSet <- read.table(testSetFile)

## Reading test labels
testLabelsFile <- paste(dataSetPath, testFolder, "y_test.txt", sep = "/")
testLabels <- read.table(testLabelsFile)

## Reading test subjects
testSubjectsFile <- paste(dataSetPath, testFolder, "subject_test.txt", sep = "/")
testSubjects <- read.table(testSubjectsFile)

## Reading features data
featuresFile <- paste(dataSetPath, "features.txt", sep = "/")
features <- read.table(featuresFile)

## Reading activities data
activitiesFile <- paste(dataSetPath, "activity_labels.txt", sep = "/")
activities <- read.table(activitiesFile)

## Merging training and test data sets, labels and subjects
dataSet <- rbind(trainingSet, testSet)
labels <- rbind(trainingLabels, testLabels)
subjects <- rbind(trainingSubjects, testSubjects)

## Selecting the mean and std related features
features <- features[grepl("-mean\\(\\)", tolower(features$V2)) | grepl("-std\\(\\)", tolower(features$V2)), ]
features$V1 <- paste0("V", features$V1)

## Renaming the merged dataset column names with the correspondent feature name
dataSet <- dataSet[, features$V1]
names(dataSet) <- features$V2

## Merging the labels and activities
labels <- merge(labels, activities)

## Merging the labels, subjects and dataset
dataSet <- cbind(labels$V2, subjects, dataSet)

## Renaming the activity and subject columns of the merged dataset
names(dataSet)[1] <- "activity"
names(dataSet)[2] <- "subject"
## Renaming the measurement columns with descriptive names
names(dataSet) <- gsub("\\(\\)","",names(dataSet))
names(dataSet) <- gsub("-",".",names(dataSet))

## Generating the average of the measurement columns in the merged dataset
## grouping by activity and subject
summaryDataSet <- dataSet %>% group_by(activity, subject) %>% summarise_each(funs(mean))

## Printing the summarized dataset
summaryDataSet


