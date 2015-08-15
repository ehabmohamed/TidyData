library(dplyr)
dataSetPath <- "./UCI HAR Dataset"
trainingFolder <- "train"
testFolder <- "test"

trainingSetFile <- paste(dataSetPath, trainingFolder, "X_train.txt", sep = "/")
trainingSet <- read.table(trainingSetFile)##), nrows = 500)

trainingLabelsFile <- paste(dataSetPath, trainingFolder, "y_train.txt", sep = "/")
trainingLabels <- read.table(trainingLabelsFile)##, nrows = 500)

trainingSubjectsFile <- paste(dataSetPath, trainingFolder, "subject_train.txt", sep = "/")
trainingSubjects <- read.table(trainingSubjectsFile)##, nrows = 500)



testSetFile <- paste(dataSetPath, testFolder, "X_test.txt", sep = "/")
testSet <- read.table(testSetFile)##, nrows = 500)

testLabelsFile <- paste(dataSetPath, testFolder, "y_test.txt", sep = "/")
testLabels <- read.table(testLabelsFile)##, nrows = 500)

testSubjectsFile <- paste(dataSetPath, testFolder, "subject_test.txt", sep = "/")
testSubjects <- read.table(testSubjectsFile)##, nrows = 500)


featuresFile <- paste(dataSetPath, "features.txt", sep = "/")
features <- read.table(featuresFile)##, nrows = 2)


activitiesFile <- paste(dataSetPath, "activity_labels.txt", sep = "/")
activities <- read.table(activitiesFile)


dataSet <- rbind(trainingSet, testSet)
labels <- rbind(trainingLabels, testLabels)
subjects <- rbind(trainingSubjects, testSubjects)



features <- features[grepl("mean", tolower(features$V2)) | grepl("std", tolower(features$V2)), ]
features$V1 <- paste0("V", features$V1)

dataSet <- dataSet[, features$V1]
names(dataSet) <- features$V2


labels <- merge(labels, activities)

dataSet <- cbind(labels$V2, subjects, dataSet)
names(dataSet)[1] <- "activity"
names(dataSet)[2] <- "subject"


summaryDataSet <- dataSet %>% group_by(activity, subject) %>% summarise_each(funs(mean))

summaryDataSet <- data.frame(summaryDataSet)

summaryDataSet

##write.table(x = summaryDataSet, file = "dataset.txt", row.name=FALSE)

