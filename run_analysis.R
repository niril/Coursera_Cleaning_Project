run_analysis <- function() {
    ##Main function that runs the analysis. Loads the data and returns a single data frame with the subjects, 
    ##whether they are in the test or train group, the excersize and the measured data (only mean and standard deviation)
    
    ##load train data
    train<-loadData("train")
    ##load test data
    test<-loadData("test")
    ##Add train and test to one data frame
    rbind(train,test)
}

loadData <- function(ToT="train") {
    ##Takes variable ToT ("Train or Test") which corespond to the folder and text file name.
    ##Function reads the data and returns an ordered data frame with the subjects, whether they are in the
    ##test or train group, the excersize and the measured data (only mean and standard deviation)
    
    ##Read subject identifiers
    subject <- read.table(paste0(ToT,"/subject_",ToT,".txt"), colClasses="factor", col.names = "Subject")
    ##Make factor identifier to whether the subject is in the Train or Test group
    TrainOrTest<-factor(rep(ToT,dim(subject)[1]))
    ##Read in training labels and assign the activity name
    y <- read.table(paste0(ToT,"/y_",ToT,".txt"), colClasses="factor", col.names = "activity")
    levels(y$activity)<-read.table("activity_labels.txt")[,2]
    ##Read in measurement variables and assign names
    x <- read.table(paste0(ToT,"/x_",ToT,".txt"))
    colnames(x)<-read.table("features.txt")[,2]
    ##Pick out desired data: only means and standard deviation
    x <- x[,(grepl("mean()",colnames(x),fixed =TRUE))|(grepl("std()",colnames(x),fixed =TRUE))]
    ##Merge data into one data.frame
    cbind.data.frame(subject,TrainOrTest,y,x)
}