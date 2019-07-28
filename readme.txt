Files: Subject_test.txt and subject_train.txt

- each row contais the identification of the subject submited to the test or to the train
- we have 30 subjects 30% (9 subjects) submited to the Test and 70% (21 subjects) to Train.


Files x_test.txt and x_train.txt

- each row contains the test and train sets, for each subject, registered on each line of subjext_test.txt and subject_train.txt files.

Files y_test.txt and y_train.txt

- each row contais the activity labels for each line of the data set

Proccess for creating a tidy dataset

Creating the directory and downloading the files

- First I check and create the working directory
- Next I download the ZIP file and unpack it on my local directory


- TRAIN DATA

	- I need to load all TXT files that I will use. all my code is commented for executing the following steps
	- First I merged the subjects to a column called datatype to identify the data type  (train or test)
	- Second I merged the activities labels to test labels, to identify by description the activities of tha collected data
	- Thir I checked if the datasets have the same number of rows, to bind the columns together, and create a single TRAIN data set,
	with subjectid, activityid, activitylabel, datatype (Train or Test) and data collected.

- For TEST DATA I made same steps above.
- Than I binded both datasets, to have a single and complete data set, with all columns and all data collected for training and for testing.


You should create one R script called run_analysis.R that does the following.

OK 1 - Merges the training and the test sets to create one data set.

2 - Extracts only the measurements on the mean and standard deviation for each measurement.

OK 3 - Uses descriptive activity names to name the activities in the data set

4 - Appropriately labels the data set with descriptive variable names.

5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.