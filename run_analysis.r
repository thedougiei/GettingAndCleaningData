library (reshape2)
setwd("N:/coursera/GettingandCleaningData/project")

dir <- file.path("./UCI HAR Dataset")
dirtest <- file.path("./UCI HAR Dataset/test")
dirtrain <- file.path("./UCI HAR Dataset/train")





## Read the raw data files


## read X train and test sets and bind
## read feature names and and to combined Test & Train data

vTest<-read.table(file.path(dirtest,'x_test.txt'))
vTrain<-read.table(file.path(dirtrain,'x_train.txt'))
vX <- rbind(vTrain, vTest)
features<-read.table(file.path(dir,'features.txt'))
colnames(vX) <- features[,2]

## read Y train and test, combine, add appropriate column name
##
vTest<-read.table(file.path(dirtest,'y_test.txt'))
vTrain<-read.table(file.path(dirtrain,'y_train.txt'))
vY <- rbind(vTrain, vTest)
names(vY)<-list(c('ActivityId'))

## read subject test and train data set, combine, add appropriate column name
##
vTest<-read.table(file.path(dirtest,'subject_test.txt'))
vTrain<-read.table(file.path(dirtrain,'subject_train.txt'))
vSubject <- rbind(vTrain, vTest)
names(vSubject)<-list(c('Subject'))

## read activity descriptions
## 
vActivity<-read.table(file.path(dir,'activity_labels.txt'))
colnames(vActivity)<-c('ActivityId','ActivityType')

## add descriptive element to vY

library(sqldf) #load sqldf package

vY <- sqldf("select ActivityType from vY join vActivity using(ActivityId)")

## now merge the data sets to give a single combined set

vTidyData1 <- cbind(vSubject,vY,vX)


## now get the subset of columns that have mean or std
##
SelectedColNames <- names(vTidyData1)[grep("mean\\(|std\\(", names(vTidyData1))]
vTidyData2 <- vTidyData1[, c("Subject", "ActivityType", SelectedColNames)]


## Avg of each variable for each subject and activity 

vTidyData3 <- melt(vTidyData2, id=c("Subject", "ActivityType"))
vTidyData3 <- dcast(vTidyData3, ActivityType + Subject ~ variable, mean)

## Export to file

write.table(vTidyData3 ,'TidyDataSetFinal.txt',quote=F, sep="\t", row.names=F)
