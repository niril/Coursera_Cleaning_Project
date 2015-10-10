#Code book for Coursera cleaning data course

##Variables in functions

###run_analysis()
Is called without any variables.

###loadData(ToT = "train")
Is called with the string variable which can be either "train" or "test".

##Data output

###run_analysis()
Returns a data frame with the columns:
1 - Subject - Subject identifier (integer).
2 - TrainOrTest - Identifier for Train or Test group (factor).
3 - activity - Identifier for the activity measured (factor).
4-69 - Various names indicating measurement with mean() or std() identifying either mean or standard deviation values (numeric). 

###loadData(ToT = "train")
Returns an identical data frame as run_analysis() but only with data from a single folder identified by the ToT variable.

##Data transformations
The subject identifier is read from the "subject_"...".txt" file and is unchanged.
The activity is read from the "y_"...".txt" file and is turned into a factor variable by the labels in "activity_labels.txt".
The data set is read from "x_"...".txt" and the column name to identify the measured data is read from "features.txt". Only measured data containing the mean or standard deviation is used, all other data is disregarded.
A factor (TrainOrTest) is added to identify if the observation is in the training or test data set.

Data is added to a single data frame.
