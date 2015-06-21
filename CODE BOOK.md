# Human Activity Recognition Using Smartphones Dataset,Version 1.0 (Tidy Data)



###Modified for Getting and Cleaning Data course project.



##Background



This extract of the Human Activity Recognition Using Smartphones Dataset provides a tidy dataset form with the goal of providing a clean and tidy data resource for  learning statistical reasoning using the R language. 





###Data Citation

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit?degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws



##Abstract for the Human Activity Recognition Using Smartphones Dataset



The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 



## Subset Variable List



### Feature Selection of  the raw data



The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 



Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 



Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 



These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



* tBodyAcc-XYZ



* tGravityAcc-XYZ



* tBodyAccJerk-XYZ



* tBodyGyro-XYZ



* tBodyGyroJerk-XYZ



* tBodyAccMag



* tGravityAccMag



* tBodyAccJerkMag



* tBodyGyroMag



* tBodyGyroJerkMag



* fBodyAcc-XYZ



* fBodyAccJerk-XYZ



* fBodyGyro-XYZ



* fBodyAccMag



* fBodyAccJerkMag



* fBodyGyroMag



* fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 

* mean(): Mean value



* std(): Standard deviation



### Anything new:

1. Combine the data of two groups (test and train) into one dataset.

2. Clarify the activities by replacing the activity_labels with the activity names.

3. Conluded  clear feature names in the data.

You can reach data directly if you get the subject number, activity names and the features !


### Case Identification of the tidy data

* Activity  : The activity name.



* Subject : The number of the subject.



**NOTES: In the output of the tidy data, the row names and column names have been avoid. But in the scripts, you can check the "tidy" variable to see the full dataset with row names. During the make.name() process, the output of "()" and "_" have been replaced by the "." , so the variable names have a few different from the raw data code book.**

* As a result, the following is the real names of variable of the tidy data output. (which is also shown in the "names.txt")

Subject

Activity

tBodyAcc.mean...X

tBodyAcc.mean...Y

tBodyAcc.mean...Z

tBodyAcc.std...X

tBodyAcc.std...Y

tBodyAcc.std...Z

tGravityAcc.mean...X

tGravityAcc.mean...Y

tGravityAcc.mean...Z

tGravityAcc.std...X

tGravityAcc.std...Y

tGravityAcc.std...Z

tBodyAccJerk.mean...X

tBodyAccJerk.mean...Y

tBodyAccJerk.mean...Z

tBodyAccJerk.std...X

tBodyAccJerk.std...Y

tBodyAccJerk.std...Z

tBodyGyro.mean...X

tBodyGyro.mean...Y

tBodyGyro.mean...Z

tBodyGyro.std...X

tBodyGyro.std...Y

tBodyGyro.std...Z

tBodyGyroJerk.mean...X

tBodyGyroJerk.mean...Y

tBodyGyroJerk.mean...Z

tBodyGyroJerk.std...X

tBodyGyroJerk.std...Y

tBodyGyroJerk.std...Z

tBodyAccMag.mean..

tBodyAccMag.std..

tGravityAccMag.mean..

tGravityAccMag.std..

tBodyAccJerkMag.mean..

tBodyAccJerkMag.std..

tBodyGyroMag.mean..

tBodyGyroMag.std..

tBodyGyroJerkMag.mean..

tBodyGyroJerkMag.std..

fBodyAcc.mean...X

fBodyAcc.mean...Y

fBodyAcc.mean...Z

fBodyAcc.std...X

fBodyAcc.std...Y

fBodyAcc.std...Z

fBodyAcc.meanFreq...X

fBodyAcc.meanFreq...Y

fBodyAcc.meanFreq...Z

fBodyAccJerk.mean...X

fBodyAccJerk.mean...Y

fBodyAccJerk.mean...Z

fBodyAccJerk.std...X

fBodyAccJerk.std...Y

fBodyAccJerk.std...Z

fBodyAccJerk.meanFreq...X

fBodyAccJerk.meanFreq...Y

fBodyAccJerk.meanFreq...Z

fBodyGyro.mean...X

fBodyGyro.mean...Y

fBodyGyro.mean...Z

fBodyGyro.std...X

fBodyGyro.std...Y

fBodyGyro.std...Z

fBodyGyro.meanFreq...X

fBodyGyro.meanFreq...Y

fBodyGyro.meanFreq...Z

fBodyAccMag.mean..

fBodyAccMag.std..

fBodyAccMag.meanFreq..

fBodyBodyAccJerkMag.mean..

fBodyBodyAccJerkMag.std..

fBodyBodyAccJerkMag.meanFreq..

fBodyBodyGyroMag.mean..

fBodyBodyGyroMag.std..

fBodyBodyGyroMag.meanFreq..

fBodyBodyGyroJerkMag.mean..

fBodyBodyGyroJerkMag.std..

fBodyBodyGyroJerkMag.meanFreq..