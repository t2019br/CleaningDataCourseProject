# CleaningDataCourseProject
Getting and Cleaning Data Course - Final Course Project

To start the analysis, you should download the run_analysis.R script to any directory, and run the go() funciton of the script.<br>
The script has 2 funcitons: download() and go(). The download function creates a working directory on drive c, downloads de zip file and unzip it. The go funciont start processing the files, and generates the tidy dataset on a output directory.<br>

To run the script you should do, the following Steps:<br>

1 - ### go to your R console <br>
2 - source("your_chosen_directory/run_analysis.R") ### Source your script<br>
3 - go() ### Call the starting function<br>
<br><br>
The script will make all transformations asked in the course project, and creates a TXT file with the write.table() using row.name=FALSE, called <b>tidy_dataset.txt</b>, that I'd uploaded on my project submission.<br><br>

1 - Merges the training and the test sets to create one data set.<br>
2 - Extracts only the measurements on the mean and standard deviation for each measurement.<br>
3 - Uses descriptive activity names to name the activities in the data set<br>
4 - Appropriately labels the data set with descriptive variable names.<br>
5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
