#CodeBook for "Getting and Cleaning Data" course final project.

To start the analysis, you should download the run_analysis.R (that is in this repository) to any directory, and run the go() funciton of the script.<br>
The script has 2 funcitons: download() and go(). The download function creates a working directory on drive c, downloads de zip file and unzip it. The go funciont start processing the files, and generates the tidy dataset on a output directory.<br>

To run the script you should do the following Steps:<br>

1 - Open your R console <br>
2 - Source("your_chosen_directory/run_analysis.R"), to source the script<br>
3 - go(), to Call the starting function<br>
<br><br>
The script will make all transformations asked in the course project, and creates a TXT file with the write.table() using row.name=FALSE, called <b>tidy_dataset.txt</b>, that I'd uploaded on my project submission.<br><br>

1 - Files used in this project:
activities_labels
features
subject_train
X_train
Y_train


