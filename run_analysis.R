#Getting and Cleaning Data Course Project

#Script for
# 0 - Download and create the working directory.
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 - Uses descriptive activity names to name the activitys in the data set
# 4 - Appropriately labels the data set with descriptive variable names.
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Download files and set directory

download <- function()
{
        DataDirectory <-"D:/CleaningDataProject"
        zipURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        filename<-"project.zip"
        
        #Testing if directory exists
        if (file.exists(DataDirectory))
        {
                setwd(DataDirectory)
        } else {
                dir.create(file.path(DataDirectory))
                setwd(DataDirectory)
        } 
        
        #Testing if the file was dowloaded
        if (!file.exists(paste0(DataDirectory,"/",filename)))
        {
                download.file(zipURL,destfile=filename, method="libcurl")
                unzip(filename)                
        }    
        download<-paste0(DataDirectory,"/UCI HAR Dataset")
}

# Function to Start the analysis
go <- function()
{
#Question 1 - Merges the training and the test sets to create one data set.
        
        #Defining Data Directory
        setwd(download())
        
        #Load activites label
        activities_labels<-read.table("./activity_labels.txt",col.names=c("ActivityId","ActivityLabel"))
 
        #Load features
        features<-read.table("./features.txt",col.names=c("id","featuresfunc"))
        
        #MAKE TRAIN DATASET WITH ALLSUBJECT AND DATA COLLECTED
                #Load Subjects that participate on Train
                subject_train<-read.table("./train/subject_train.txt",col.names=c("SubjectId"))
        
                #Load data set of collected data
                X_train<-read.table("./train/x_train.txt",col.names=features$featuresfunc)
                
                #Load activitys of each collectad data
                Y_train<-read.table("./train/y_train.txt",col.names=c("ActivityId"))
                
                #check if the number of rows is equal at the datasets to bind columns.
                if (nrow(subject_train) == nrow(X_train) & nrow(Y_train) == nrow(Y_train))
                {
                        #bind activitys description and id coluns to data collected
                        train_ds<-cbind(Y_train,X_train)
                        #bind previous dataset the column to identify the subject that participated
                        train_ds<-cbind(subject_train,train_ds)
                }
                rm(X_train,Y_train,subject_train)

        #MAKE TEST DATASET WITH ALLSUBJECT AND DATA COLLECTED
                #Load Subjects that participate on Train
                subject_test<-read.table("./test/subject_test.txt",col.names=c("SubjectId"))
                
                #Load data set of collected data
                X_test<-read.table("./test/x_test.txt",col.names=features$featuresfunc)
                
                #Load activitys of each collectad data
                Y_test<-read.table("./test/y_test.txt",col.names=c("ActivityId"))
                
                #check if the number of rows is equal at the datasets to bind columns.
                if (nrow(subject_test) == nrow(X_test) & nrow(Y_test) == nrow(Y_test))
                {
                        #bind activitys description and id columns to data collected
                        test_ds<-cbind(Y_test,X_test)
                        #bind previous dataset the column to identify the subject that participated
                        test_ds<-cbind(subject_test,test_ds)
                }
                rm(X_test,Y_test,subject_test,features)

        
        #merge Train and Test data in one dataset - answer for question 1
        q1dataset <- rbind(train_ds,test_ds) 
        
        #carregando pacote dplyr
        library(dplyr)

#Question 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

        #Selecting only the columns that will be needed for questions 3,4 and 5.
        #Answer for question 2
        q2dataset<-select(q1dataset,SubjectId,ActivityId,contains("mean"),contains("std"))

#Question 3 - Uses descriptive activity names to name the activities in the data set         

        #Answer for question 3 with activites descriptions.
        q2dataset<-merge(q2dataset,activities_labels,by.x="ActivityId",by.y="ActivityId")
        
#Question 4 - Appropriately labels the data set with descriptive variable names.
#Acording to features_info.txt we have some abreviations that can be changed:
# acc - Accelerometer, gyro - Gyroscope, prefix t - Time, prefix f - Frequency, mag - Magnitude
#I took the ".", "-" and "()" out of the name of the columns names, 
# and captalize first letters of the functions mean and std.
        
names(q2dataset) <-gsub("Acc","Accelerometer",names(q2dataset))
names(q2dataset) <-gsub("Gyro","Gyroscope",names(q2dataset))
names(q2dataset) <-gsub("^t","Time",names(q2dataset))
names(q2dataset) <-gsub("^f","Frequency",names(q2dataset))
names(q2dataset) <-gsub("Mag","Magnitude",names(q2dataset))
names(q2dataset) <-gsub("-mean()","Mean",names(q2dataset))
names(q2dataset) <-gsub("-std()","STD",names(q2dataset))
names(q2dataset) <-gsub("-freq()","Freq",names(q2dataset))
names(q2dataset) <-gsub("tBody","TimeBody",names(q2dataset))
names(q2dataset) <-gsub("\\.","",names(q2dataset))
names(q2dataset) <-gsub("std","Std",names(q2dataset))
names(q2dataset) <-gsub("mean","Mean",names(q2dataset))


#Question 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        #Grouping information by activity and subject, and 
        tidy_dataset<-group_by(select(q2dataset,-ActivityId),ActivityLabel,SubjectId)
        
        #making the average for each variable of the dataset
        tidy_dataset<-summarise_all(tidy_dataset,"mean")

        rm(q1dataset,q2dataset,activities_labels)    
        
        #check if the final dataset has 180 rows to generate the file
        #it must have 180 rows that is: 30 subjects and times 6 activities = 180 combinations.
        if (nrow(tidy_dataset)==180)
        {
                #generate txt file with the tidy dataset to upload to coursera
                write.table(tidy_dataset,"./tidy_dataset.txt", row.name=FALSE)
        }
        rm(tidy_dataset)   
}