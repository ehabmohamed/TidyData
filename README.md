# Human Activity Recognition Analysis using R

This guide explains the different code parts in the **run_analusis.R** script.

## Using the dplyr library
The script first loads the `dplyr` library to be used.
```{r}
library(dplyr)
```
## Setting the data path variables
The below code sets dataset path, training and test folder names to variables.

```{r}
dataSetPath <- "./UCI HAR Dataset"
trainingFolder <- "train"
testFolder <- "test"
```

## Reading data
### Reading training dataset
The script here prepares the complete relative path using `paste()` function and loads the **Training Dataset** using `read.table()` function.
```{r}
trainingSetFile <- paste(dataSetPath, trainingFolder, "X_train.txt", sep = "/")
trainingSet <- read.table(trainingSetFile)
```
### Reading training labels
The script here prepares the complete relative path using `paste()` function and loads the **Training Labels** using `read.table()` function
```{r}
trainingLabelsFile <- paste(dataSetPath, trainingFolder, "y_train.txt", sep = "/")
trainingLabels <- read.table(trainingLabelsFile)
```
### Reading training subjects
The script here prepares the complete relative path using `paste()` function and loads the **Training Subjects** using `read.table()` function.
```{r}
trainingSubjectsFile <- paste(dataSetPath, trainingFolder, "subject_train.txt", sep = "/")
trainingSubjects <- read.table(trainingSubjectsFile)
```

### Reading test dataset
The script here prepares the complete relative path using `paste()` function and loads the **Test Dataset** using `read.table()` function.
```{r}
testSetFile <- paste(dataSetPath, testFolder, "X_test.txt", sep = "/")
testSet <- read.table(testSetFile)
```

### Reading test labels
The script here prepares the complete relative path using `paste()` function and loads the **Test Labels** using `read.table()` function.
```{r}
testLabelsFile <- paste(dataSetPath, testFolder, "y_test.txt", sep = "/")
testLabels <- read.table(testLabelsFile)
```

### Reading test subjects
The script here prepares the complete relative path using `paste()` function and loads the **Test Subjects** using `read.table()` function.
```{r}
testSubjectsFile <- paste(dataSetPath, testFolder, "subject_test.txt", sep = "/")
testSubjects <- read.table(testSubjectsFile)
```

### Reading features data
The script here prepares the complete relative path using `paste()` function and loads the **Features Data** using `read.table()` function.
```{r}
featuresFile <- paste(dataSetPath, "features.txt", sep = "/")
features <- read.table(featuresFile)
```

### Reading activities data
The script here prepares the complete relative path using `paste()` function and loads the **Activities Data** using `read.table()` function.
```{r}
activitiesFile <- paste(dataSetPath, "activity_labels.txt", sep = "/")
activities <- read.table(activitiesFile)
```

## Merging training and test data sets, labels and subjects
The script then merges the training and test datasets, labels and subjects using the `rbind()` function.
```{r}
dataSet <- rbind(trainingSet, testSet)
labels <- rbind(trainingLabels, testLabels)
subjects <- rbind(trainingSubjects, testSubjects)
```

## Selecting the mean and std related features
The script here filters the **Features Data** using the `grepl()` function to retrieve the mean and standard deviation related features.
```{r}
features <- features[grepl("mean", tolower(features$V2)) | grepl("std", tolower(features$V2)), ]
features$V1 <- paste0("V", features$V1)
```

## Renaming the merged dataset column names with the correspondent feature name
The script then uses the filtered **Features Data** to renames the **Merged Dataset** measurement variables using the `names()` function.
```{r}
dataSet <- dataSet[, features$V1]
names(dataSet) <- features$V2
```

## Merging the labels and activities
The script here joins the **Labels Data** and **Activities Data** using the `merge()` function.
```{r}
labels <- merge(labels, activities)
```

## Merging the labels, subjects and dataset
The script here merges the **Labels Data**, **Subjects Data** and **Merged Dataet** using the `cbind()` function.
```{r}
dataSet <- cbind(labels$V2, subjects, dataSet)
```

## Renaming the activity and subject columns of the merged dataset
The script here renames the *activity* and *subject* variables in the **Merged Dataset** using the `names()` function.
```{r}
names(dataSet)[1] <- "activity"
names(dataSet)[2] <- "subject"
```
## Renaming the measurement columns with descriptive names
The script here renames the measurement variables in the **Merged Dataset** with descriptive names using the `names()` and `gsub` functions.
```{r}
names(dataSet) <- gsub("\\(\\)","",names(dataSet))
names(dataSet) <- gsub("-",".",names(dataSet))
```
## Generating the average of the measurement columns in the merged dataset grouping by activity and subject
The script then summarizes the **Merged Dataset** using the `dplyr` library.
The script here generates the average of the measurement columns grouping by *activity* and *subject*.
```{r}
summaryDataSet <- dataSet %>% group_by(activity, subject) %>% summarise_each(funs(mean))
```

## Printing the summarized dataset
The script finally prints the **Summarized Dataset**.
```{r}
summaryDataSet
```

