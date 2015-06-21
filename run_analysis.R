
# setwd("D:\\STUDY\\Coursera\\JH_series\\3_getdata\\project\\new")

################################
##### Download the data ########
################################
if(!file.exists("UCI HAR Dataset")) ## check the directory
{
        if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip"))
        {
                download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                              destfile = "./getdata_projectfiles_UCI HAR Dataset.zip")
        } 
        unzip("./getdata_projectfiles_UCI HAR Dataset.zip")
}

############################
#### Load the data #########
############################
rootdir <- getwd()
setwd("UCI HAR Dataset")
UCIdir <- getwd()

# # Get labels
# label <- read.table("activity_labels.txt", header = FALSE, sep = " ")

# Get features
features <- read.table("features.txt", header = FALSE)

# Read in " train" data
setwd("train")
message("Reading in the large 'X_train' file, please wait...")
x_train <- read.table("X_train.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)

# Read in " test" data
setwd(UCIdir)
setwd("test")
message("Reading in the large 'X_test file, please wait...")
x_test <- read.table("X_test.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)



##########################
### merge the data########
##########################

# # add labels to the data ######### XXXXXXXXX   #### use merge is not right here....
# ytrain_lab <- merge(y_train, label, by.x = "V1", by.y = "V1")
# 
# ytest_lab <- merge(y_test, label, by.x = "V1", by.y = "V1")



# change the y_test series numbers to label names
for(i in 1 : length(y_test$V1)){
        if (y_test$V1[i] == 1) {y_test$V2[i] <- "WALKING"}
        if (y_test$V1[i] == 2) {y_test$V2[i] <- "WALKING_UPSTAIRS"}
        if (y_test$V1[i] == 3) {y_test$V2[i] <- "WALKING_DOWNSTAIRS"}
        if (y_test$V1[i] == 4) {y_test$V2[i] <- "SITTING"}
        if (y_test$V1[i] == 5) {y_test$V2[i] <- "STANDING"}
        if (y_test$V1[i] == 6) {y_test$V2[i] <- "LAYING"}               
}

for(i in 1 : length(y_train$V1)){
        if (y_train$V1[i] == 1) {y_train$V2[i] <- "WALKING"}
        if (y_train$V1[i] == 2) {y_train$V2[i] <- "WALKING_UPSTAIRS"}
        if (y_train$V1[i] == 3) {y_train$V2[i] <- "WALKING_DOWNSTAIRS"}
        if (y_train$V1[i] == 4) {y_train$V2[i] <- "SITTING"}
        if (y_train$V1[i] == 5) {y_train$V2[i] <- "STANDING"}
        if (y_train$V1[i] == 6) {y_train$V2[i] <- "LAYING"}               
}

# rename
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"
names(x_test) <- features[,2]
names(x_train) <- features[,2]


test_data <- cbind.data.frame(Groups = "test", Subject = subject_test, Activity = y_test[,2], x_test)
train_data <- cbind.data.frame(Groups = "train", Subject = subject_train, Activity = y_train[,2], x_train)

whole_data <- rbind.data.frame(test_data, train_data)

##################################
#######  Subset the data   #######
##################################


library(dplyr)

### !!!!!!!!! make.names() function, make it possible to select columns with data.frame "names")
names(whole_data) <- make.names(names=names(whole_data), unique=TRUE, allow_ = TRUE)

selected <- select(whole_data, matches("(Groups)+|(Activity)+|(Subject)+|(mean)+|(std)+", ignore.case = FALSE))

# Group the data and get the mean of each subjects for their activities
grouped <- group_by(selected, Subject, Activity)   
tidy <- summarise_each(grouped, funs(mean), -(Groups : Subject))

# Save the names of the data frame [TO WRITE THE CODE BOOK]
NAMES <- names(tidy)
write.table(COl, file = "names.txt", row.names = FALSE, col.names = FALSE)

# write the txt file
setwd(rootdir)
write.table(tidy, file = "tidy_data.txt", row.names = FALSE, col.names = FALSE)


