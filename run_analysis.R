run_analysis <- function(){
        
       
        
        library(dplyr)
        ######################################    
        #  read data in the UCI HAR Dataset ##
        ######################################
        
        dir_root <- getwd()
        
        setwd("UCI HAR Dataset")
        dir_data <- getwd()
        

        features <- tbl_df(read.table("features.txt"))
        
        
        
 
        #########################################
        ## read data in the test & train folder##
        #########################################
        # go into test
        setwd("test")
        X_test <- tbl_df(read.table("X_test.txt"))
        Y_test <- tbl_df(read.table("y_test.txt")) 
        subject_test <- tbl_df(read.table("subject_test.txt"))

        
        #setwd("Inertial Signals")
        
        #test_files <- list.files()
        
        #body_acc_x_test <- read.table("body_acc_x_test.txt")
        #body_acc_y_test <- read.table("body_acc_y_test.txt")
        #body_acc_z_test <- read.table("body_acc_z_test.txt")
        #body_gyro_x_test <- read.table("body_gyro_x_test.txt")
        #body_gyro_y_test <- read.table("body_gyro_y_test.txt")
        #body_gyro_z_test <- read.table("body_gyro_z_test.txt")
        #total_acc_x_test <- read.table("total_acc_x_test.txt")
        #total_acc_y_test <- read.table("total_acc_y_test.txt")
        #total_acc_z_test <- read.table("total_acc_z_test.txt")
        
        
        
        
        
        # go into train
        setwd(dir_data)
        setwd("train")
        X_train <- tbl_df(read.table("X_train.txt"))
        #The originial data is indeed the 'y', but not the 'Y'
        Y_train <- tbl_df(read.table("y_train.txt"))
        subject_train <- tbl_df(read.table("subject_train.txt"))
        
        
        #setwd("Inertial Signals")
        
        #train_files <- list.files()
        
        #body_acc_x_train <- read.table("body_acc_x_train.txt")
        #body_acc_y_train <- read.table("body_acc_y_train.txt")
        #body_acc_z_train <- read.table("body_acc_z_train.txt")
        #body_gyro_x_train <- read.table("body_gyro_x_train.txt")
        #body_gyro_y_train <- read.table("body_gyro_y_train.txt")
        #body_gyro_z_train <- read.table("body_gyro_z_train.txt")
        #total_acc_x_train <- read.table("total_acc_x_train.txt")
        #total_acc_y_train <- read.table("total_acc_y_train.txt")
        #total_acc_z_train <- read.table("total_acc_z_train.txt")
        
        
        # GO BACK!!!
        setwd(dir_root)
        
        # change the Y_test series numbers to label names
        for(i in 1 : length(Y_test$V1)){
                if (Y_test$V1[i] == 1) {Y_test$V2[i] <- "WALKING"}
                if (Y_test$V1[i] == 2) {Y_test$V2[i] <- "WALKING_UPSTAIRS"}
                if (Y_test$V1[i] == 3) {Y_test$V2[i] <- "WALKING_DOWNSTAIRS"}
                if (Y_test$V1[i] == 4) {Y_test$V2[i] <- "SITTING"}
                if (Y_test$V1[i] == 5) {Y_test$V2[i] <- "STANDING"}
                if (Y_test$V1[i] == 6) {Y_test$V2[i] <- "LAYING"}               
        }
        
        for(i in 1 : length(Y_train$V1)){
                if (Y_train$V1[i] == 1) {Y_train$V2[i] <- "WALKING"}
                if (Y_train$V1[i] == 2) {Y_train$V2[i] <- "WALKING_UPSTAIRS"}
                if (Y_train$V1[i] == 3) {Y_train$V2[i] <- "WALKING_DOWNSTAIRS"}
                if (Y_train$V1[i] == 4) {Y_train$V2[i] <- "SITTING"}
                if (Y_train$V1[i] == 5) {Y_train$V2[i] <- "STANDING"}
                if (Y_train$V1[i] == 6) {Y_train$V2[i] <- "LAYING"}               
        }
        
        
        test_data_with_group_name <- cbind(Groups = "test", 
                                           Activity = Y_test$V2, 
                                           Subject = subject_test, 
                                           X_test)
        
        
        
        
        train_data_with_group_name <- cbind(Groups = "train", 
                                            Activity = Y_train$V2, 
                                            Subject = subject_train, 
                                            X_train)
        
        
        
        ######################################       
        ##### deal with the whole data    ####
        ######################################
        
        whole_data <- rbind.data.frame(test_data_with_group_name, 
                                       train_data_with_group_name)
        
        colnames(whole_data) <- c("Groups", "Activity", "Subject", as.character(features$V2)) 
       
        
        
        # the make.name() function is used to avoid the error:duplicated column. 
        valid_column_names <- make.names(names=names(whole_data), unique=TRUE, allow_ = TRUE)
        names(whole_data) <- valid_column_names
        
        
        selected <- select(whole_data, 
                           matches("(Groups)+|(Activity)+|(Subject)+|(mean)+|(std)+",
                                   ignore.case = FALSE))
        
       
        


        grouped <- group_by(selected, Activity, Subject)
        
        complete <- summarise_each(grouped, funs(mean), -(Groups : Subject))
        
        write.table(complete, file = "tidy_data.txt")
        


}



