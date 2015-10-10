#Project for Coursera cleaning data course

Contains a single R file: run_analysis.R.
The R file contains two functions: run_analysis and dataLoad

run_analysis() should be called without any variables in the parant folder to train and test folders. run_analysis() returns a single data frame with the details on subject, excersize and all the mean and standard deviation data. Detail on the returned data frame in CodeBook.md. 

dataLoad(TrainOrTest = "train") is called by run_analysis to load the data in a single folder (train or test) and is called with the string variable to indicate which folder.
