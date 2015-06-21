#README

### preface

This repository is set for the project of the *Getting and Cleaning Data* class.

After almost the hard working in continiously 20 h , I finally got my tidy data (although maybe not the same as yours:) 

This readme file will include the coding analysis, coding step and special error .

In addtion, you can see the FULL CODE in the "run_analysis.R", and have a look at the variables in the "CODE BOOK.md". 

### Attention

Please make sure you have been in the following condition before you run the function.
 
* unzip the "zip", got the **UCI HAR Dataset** folder in the same directory as the "run_analysis.R". (If you didn't download the file, the script will download it for you.) And, DO NOT SET THE DIRECTORY INTO THE FOLER. 
* set the working directery with `setwd()` to make sure the directory is where the code and datast folder are.
* package "dplyr" is needed, please make sure that you have installed this package. If not, you can use `install.packages("dplyr")` to get it.

Enjoy yourself !

## coding analysis

#### README, the very first step to begin with

From the readme file, the most important thing I got is that there are 30 subjects in the experiment, and they are seperated by 6(test) and 24(train).

From the disccusion forum, I knows that theses data of the 30 subjects should be included in one dataset (as the project step 1 said). using `rbind.data.frame()`
maybe a good idea.

What's more, I opened those file with Notepad++, obseved them again and again.The most useful information I got from this is to get the label details.

*As most people did, I fistly thought that the Inertial Signals folder would be useful, too,which cause me a lot of time.*

#### analysis the dimension of the raw data

At first, I got no idea where to start, although I have read through the dissussion forum. It is not until I read almost every table into the workspace and check their dimension, did I find the right way to tidy up the data.

	> dim(x_test)
	[1] 2947  561
	> dim(x_train)
	[1] 7352  561
	> dim(features)
	[1] 561   2

 
As we can see above, the "561" combinded these data together.

	> dim(y_test)
	[1] 2947    1
	> dim(y_train)
	[1] 7352    1
	> dim(subject_test)
	[1] 2947    1
	> dim(subject_train)
	[1] 7352    1

And then, when we have a look at the y_file, we got the seperately connection of the number 2947 and 7352.

So I draw a draft to decide how to combind the data together.


		|Groups |	Activity |	Subject |  		{features}	  |	
	---------------------------------------------------------
		|		|	{y_...}	 |	  		|		561 col		  |
	--------------------------------------------------------		
		|test	|	Walking	 |		1	|					  |
	A	|test	|	Walking  |		2	|		{x_test}   	  |
		|...	|	 ...	 |			|	  (2947*561)	  |
		|test	|			 |			|					  |
	---------------------------------------------------------
		|train	|			 |			|					  |
		|train	|			 |			|		{x_train}	  |
	B	|...	|			 |			|	 (7352*561)		  |
		|train	| 			 |			|					  |

As we can see above, the largest data is the x_..., so I use these two x_... as the bas to create my dataset.

The "Groups" column in the first row finally deleted by me, because I don't think it necessary to be in the final dataset.

The Activity column have a closed relationship with the activity_labels and the y_... data. Although I plan to use `merge` to combine them at first, I chose to use the for loop at alst because I'm more familiar with the for loop. (Anyway, the TA have also said that it doesn't matter what way we used.)

The subject is not simply 30*6, or how could it be 10000+ rows? So it need to be deal with something (the mean function, with grouped dataset)

The features with a dimension of 561 , apparently, should be used as the colnames of the dataset. A `colnames()` function is good here. 

Above is my analysing step. when it comes to coding, some difference might com out.


## coding step

In fact, I didn't stritly follow the 5 step in the project pages.I would appreciate it if you can overview my coding step :)

And, I do think I reach the goal. I would appreciate it again and again if you can give me a good grade :)

####  read data in the UCI HAR Dataset 

1. get current dir : used for output of the tidy data
2. come into the folder and read  "activity labels" and "features"
3. set them to tbl form

#### read data in the test & train folder

seperatly:

1. read the "subject", "X" and "Y" data.
2. set them to tbl form.
3. deal with Y: using for loop to give Ys a second column with the activitiy label names.
4. cbind the "group", "activity" and "subject" together to make the large data A `#test_data_with_group_name` and B `# train_data_with_group_name` (A, B draws in the draft.)

#### deal with the whole data 1
1. rbind the A and B to get the whole data `#whole_data` with groups, activity and subject.
2. rename the column names of the whole data with `colnames()`
3. ! A `make.names()` function. It would be explained in details in the *special error* module. It is used before the `select()` function to avoid error.
4. select the aimed colum (with mean and std) with `select()` function.

#### deal with the whole data 2

1. group the data with "Activity" and "Subect" column.
2. get the last dataset by `summarize_each()`, counting the mean of the grouped dataset.
3. use `write.table()` to give the output.

FINISHED !! CHEERED !!

## special error
#### make.names
Before using this function, the error occurs when I run the select() function

	> selected <- select(whole_data, matches("(Groups)+|(Activity)+|(Subject)+|(mean)+|(std)+", ignore.case = FALSE))

	Error: found duplicated column name

The reason is : 

> The root of the problem is invalid characters in the original column names. The discussion in Variable Name Restrictions in R applies to column names, too. Try forcing unique column names with valid characters, with make.names() . 

[http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name](http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name)


#### the "matches()" in the select() function

As mentioned aboved, I used this style of matches to select the columns,which I got from the discussion forum.

	matches("(Groups)+|(Activity)+|(Subject)+|(mean)+|(std)+"

#### summarize_each()

In the dplyr helped pdf, the parameters shown like this.

	summarise_each(tbl, funs, ...)

At first I type like this and got an error

	> summarise_each(grouped, mean, -(Groups : Subject))
	Error in UseMethod("as.lazy_dots") : 
	  no applicable method for 'as.lazy_dots' applied to an object of class "function"

and then I search the examples and changed it like this.

	summarise_each(grouped, funs(mean), -(Groups : Subject))

Well, it works .

So, DON'T FORGET THE EXAMPLES FOREVER.(I have always done this ...)

---

### Last but not least

THANKS FOR YOUR MARKING :)


