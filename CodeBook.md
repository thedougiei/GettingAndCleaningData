## Input data

The source file is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip containing the following files:

* x_test.txt

* x_train.txt

* y_test.txt

* y_train.txt

* subject_test.txt

* subject_train.txt

* features.txt

* activity_labels.txt

## Requirements

1- To run the run_analysis.R set the correct path into setwd command. The correct path is the path where you are running the script.

2- This path must include the "UCI HAR Dataset" folder containing all the data.

## Ouptut

The ouput is a tab delimted file called TidyDataSetFinal.Txt

## Coding Notes

The comments in the script are fairlry self-explanatory

### Objective 1
* The initial objective is to create a data set called
**  vTidyData1 which merges the test and train data sets, adds feature lables and replaces the activity id with the activity description

### Objective 2
* the second step creates a data set called
**  vTidyData2 which extracts only features with mean() or std()

### Objective 3
* the final objective creates a data set called
** vTidyData3 whcih creates an average of each feature in the previous data set, for each subject and activity
** This is the ouptut data set.

### Notes - the feature names seemed relatively clean and meaningful. As such no attempt was made to 'clean' these.