library(dplyr)
library(stringr)

#Reading section 
features<-read.table("Dataset/features.txt", 
        col.names = c("feature_code","feature"))
        #Rename features
replacements <- c(
        "^t" = "TimeDomain.",
        "^f" = "FrequencyDomain.",
        "BodyBody" = "Body",
        "Acc" = "Acceleration.",
        "Gyro" = "Gyroscope.",
        "Jerk" = "Jerk.",
        "Mag" = "Magnitude.",
        "meanFreq" = "MeanFrequency.",
        "mean" = "Mean.",
        "std" = "Std.",
        "mad" = "Mad.",
        "sma" = "Sma.",
        "max" = "Max.",
        "min" = "Min.",
        "iqr" = "Iqr.",
        "entropy" = "Entropy.",
        "maxInds" = "MaxIndex.",
        "arCoeff" = "ArCoefficiency.",
        "correlation" = "Correlation",
        "skewness" = "Skewness.",
        "kurtosis" = "Kurtosis.",
        "bandsEnergy" = "BandsEnergy.",
        "energy" = "Energy.",
        "tBody" = "TimeDomain.Body",
        "angle" = "Angle.",
        "gravity" = "Gravity.",
        "[\\(\\)]" = "",   
        "," = ".",          
        "-" = ".",          
        "\\.\\." = "." ,      
        "\\.$" = "")
features$feature <- str_replace_all(features$feature, replacements)

activity_labels<-read.table("Dataset/activity_labels.txt",
        col.names = c("activity_code","activity"))
subject_test<-read.table("Dataset/test/subject_test.txt",
        col.names = "subject_number")
x_test<-read.table("Dataset/test/X_test.txt",
        col.names = features$feature)
y_test<-read.table("Dataset/test/y_test.txt",
        col.names = "activity_code")
subject_train<-read.table("Dataset/train/subject_train.txt",
        col.names = "subject_number")
x_train<-read.table("Dataset/train/X_train.txt",
        col.names = features$feature)
y_train<-read.table("Dataset/train/y_train.txt",
        col.names = "activity_code")
#Add descriptive activity names
y_test$activity<-activity_labels$activity[y_test$activity_code]
y_train$activity<-activity_labels$activity[y_train$activity_code]
#Merge training and test datasets
train_data<-cbind(subject_train,y_train,x_train)
test_data<-cbind(subject_test,y_test,x_test)
data<-rbind(train_data,test_data)
#Extract only mean and standard deviation measurements
requested_columns<-grep("Mean|Std",names(data),value = TRUE)
filtered_data<-
        select(data,subject_number,activity,all_of(requested_columns))
#Create tidy dataset with the average of each variable 
#for each activity and each subject
means<-data%>%
        group_by(subject_number,activity) %>%
        summarise_all(mean)