#Load Required Packages
library(plyr)
library(reshape2)
#Load Feature Names
FeatNames <- read.table('UCI HAR Dataset/features.txt',stringsAsFactor=FALSE)
#Load Training Data
xTrain <- read.table('UCI HAR Dataset/train/X_train.txt')
yTrain <- read.table('UCI HAR Dataset/train/y_train.txt')
SubTrain <- read.table('UCI HAR Dataset/train/subject_train.txt')
#Combine Data
TrainData <- cbind(SubTrain$V1,yTrain$V1,xTrain)
#Assign names
names(TrainData) <- c('Subject','Activity',FeatNames$V2)
#Load Test Data
xTest <- read.table('UCI HAR Dataset/test/X_test.txt')
yTest <- read.table('UCI HAR Dataset/test/y_test.txt')
SubTest <- read.table('UCI HAR Dataset/test/subject_test.txt')
#Combine Data
TestData <- cbind(SubTest$V1,yTest$V1,xTest)
#Assign names
names(TestData) <- c('Subject','Activity',FeatNames$V2)
#Merge Data
Data <- rbind(TrainData,TestData)
#Subset Required columns
ReqCol <- c(1,2,which(grepl('mean\\(\\)|std\\(\\)',names(Data))))
Data <- Data[,ReqCol]
ActivityNames <- read.table('UCI HAR Dataset/activity_labels.txt',stringsAsFactor=FALSE)
Data$Activity <- as.factor(Data$Activity)
levels(Data$Activity) <- ActivityNames$V2
Data$Subject <- as.factor(Data$Subject)
#Melt the data
DataM <- melt(Data,id=c('Subject','Activity'))
#Summarize the Data
FinalData <- dcast(DataM,Subject+Activity ~ variable,mean)
write.table(FinalData,row.names = FALSE,file='TidyData.txt')