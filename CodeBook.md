#CodeBook for "Getting and Cleaning Data" course final project.

To start the analysis, you should download the run_analysis.R (that is in this repository) to any directory, and run the go() funciton of the script.<br>
The script has 2 funcitons: download() and go(). The download function creates a working directory on drive c, downloads de zip file and unzip it. The go funciont start processing the files, and generates the tidy dataset on a output directory.<br>

To run the script you should do the following Steps:<br>

1 - Open your R console <br>
2 - Source("your_chosen_directory/run_analysis.R"), to source the script<br>
3 - go(), to Call the starting function<br>
<br><br>
The script will make all transformations asked in the course project, and creates a TXT file with the write.table() using row.name=FALSE, called <b>tidy_dataset.txt</b>, that I'd uploaded on my project submission.<br><br><br>

1 - Files loaded in this project, with dataset names created on the script:<br>
activities_labels (activity_labels.txt) - 6 rows and 2 variables - contains the activity descriptions<br>
features (features.txt) - 561 rows and 2 variables - contains the column names for the collected datas<br>
subject_train (subject_train.txt) - 7352 rows and 1 variable - contains the subjects submited to the train<br>
X_train (x_train.txt) - 7352 rows and 561 variables - contains the data collected at the train<br>
Y_train (y_train.txt) - 7352 rows and 1 variable - contains the activities performed at the train<br>
subject_test (subject_test.txt) - 2947 rows and 1 variable - contains the subjects submited to the test<br>
X_test (x_test.txt) - 2947 rows and 561 variables - contains the data collected at the test<br>
Y_test (y_test.txt) - 2947 rows and 1 variable - contains the activities performed at the test<br>
<br>
2 - Process made to join the files<br>
First load ao files into memmory, than column bind the X_test with Y_test and subject_test<br>
Than, column bind X_train with Y_train and subject_train<br>
From this create 2 variables:<bR>
test_ds - 2947 rows and 563 variables<br>
train_ds - 7352 rows and  563 variables<br>
The next step is to row bind test_ds and rain_ds, and creates a new variable:<br>
q1dataset - 10299 rows and 563 variables<br>
<br>
3 - Cleaning the data set
After bindind rows and columns, select the columns with Mean and Std<br>
q2dataset - 10299 rows and 89 variables. This dataset has de description of the activities (ActivityLabel), id of activities (ActivityId) that I will remove later, subjects (SubjectId) and the 86 variables with Mean and Std.<br>
Than change the name of the 86 variables columns<br>
acc - Accelerometer, gyro - Gyroscope, prefix t - Time, prefix f - Frequency, mag - Magnitude, I took the ".", "-" and "()" out of the name of the columns names and captalize first letters of the functions mean and std.<br>
<br>
4 - Prepare final dataset<br>
group by activity and subject and summarize data with mean funciton for each variable column<br>
tidy_dataset - 180 rows and 88 variables.


