# **Readme**
===============
---
####***Please excuse my english, not my native or day to day language***

---
#### 0. Abstract

This work is based in the Project 1, for the course [**Getting and Cleaning Data**](https://class.coursera.org/getdata-004/) from [Coursera](www.coursera.org).

---
This document describe the steps to:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

---

To create the tidy data was neccesary to follow the next steps:
    
- Read the Test and the Train files, with the Activity Vector and the Subject vector in every case, assigning the values to their respectivily data.frames.
- Merge the Data, uniting both sets of data by their rows.
- Select the colums which represent the mean() and the standard deviantion, std(), creating other data frame with these data.
- Create a list, every element of the list represent one variable (one column) of the previous data frame; every element has a matrix, in the columns are the Subjects and in the rows the activities, the intersection represent the average value for that element, with those variables.
- Create a Data Frame, with the data of the list, the first column represent the activities in set of six, the next column represent the subject, every subject has the six activities, and the next columns represent the average records.
- Save the tidy data in a file.

---
The next point describe in detail the work:


#### 1. Read Files

The script used to create the tidy data assume it start in the folder in which the directory **./UCI Har Dataset** is stored, in this directory is saved all the files with the data.

first the script save the names of this directory, and the sub-directories, to have a quick access to the files.

The name of the files were saved in a character vector with the function **dir()**, by example:

    > dir.train<-dir("./UCI Har Dataset/train"),
    > dir.train
    > [1] "Inertial Signals"  "subject_train.txt" "X_train.txt"       "y_train.txt"    

The access to every file of interest was saved in a variable, including the labels of the activities, the list of subjects and the names of the variables.

#### 2 Read of the test data frame

To read the data from the **test** were followed the next steps:

- All the files were read with the function, **read.table()**.
- The access to every files was defined in the previous step.
- There are three sets of Data: *Activities*, *Subjects* and *variables*, the first two just have one column, the third has several columns with different variables.
- The set of activities had just numbers, to match the numbers with the name of the activities was used the names in the file *activity_labels.txt*.
- A Data Frame with the three sets of data was create, with the two first columns as factor.
- The first two columns had the name of their respective files, for the names of the next column were used the names stored in the file *features.txt*.

#### 3 Read of the train data frame

To read the data set of **train** were followed the same steps, in the respective folder.

#### 4 Merge Data

To Merge both data frames *(train and test)* was used the function **rbind()**:

    > ## read.train is the data frame with the train values.
    > ## read.test is the data frame with the test values.
    > rbind(read.train,read.test)

#### 5 Selection of the variables with mean() and std()

To select the variables with measurements of the mean or the standard deviation was created a logical vector with the function **grepl()**, used with the vector of the names:

    > names.test<-grepl("-mean\\(\\)|-std\\(\\)",names.x[,2])

Followed by a subsetting of the columns acccord to this vector:

    > read.subset<-read.all[,names.test]

#### 6 Order the data with a list
It was created a list, with every element as variable and in every element a matrix with the average results of Activity Vs. Subject, to create the list was used a loop for every column, and to calculate the average of every variable by *Activity and subject* was used the function *tapply()*:


    > for(i in 1:(length(names(read.subset))-2)){
    >           read.list[[i]]<-tapply(read.subset[,i+2],                      
    >           list(read.subset[,2],read.subset[,1]),mean)
    >   }

The *tapply()* function is just apply to the values, not to the factor in the first two columns, that the reason why the loop is adjusted with the number 2.

#### 7 Creation of the Final Data Frame with the tidy data

To create the final Data Frame were followed the next steps:

- The first column represent the activities, and the second the subjects, for every set of subjects was assigned one activity, to create both vectors was used the function **rep()**:

        > read.final<-data.frame(Activity=rep(labels.y[,2],each=30),
        >                        Subject=rep(1:30,len=180))

- To assign the values was used a double loop, the first to read element by element of the list, and the second to read all the matrix of every element:


        > for(i in 1:(length(names(read.subset))-2)){
        >           vec.help<-numeric()
        >           for(u in 1:6){
        >                   vec.help<-c(vec.help,read.list[[i]][,u])
        >           }
        >           read.final[,i+2]<-vec.help
        >   }

#### 8 Write the tidy data in a "txt" file

The final step was save the tidy data in a file, to do this was used the function **write.table()**:

    > write.table(read.final,"run_analysis.txt",sep=",",row.names=F)


#### Append 1: run_analysis() function script

The complete script to tidy the data is as followed:

    run_analysis<-function(){
        
        ## 1. Read Files
        
        ## 1.1 Variables to read the Folders
        ir.ma<-"./UCI Har Dataset"
        ir.te<-"/test"
        ir.tr<-"/train"
        
        ## 1.2 Read names
        names.x<-read.table(paste(ir.ma,"/features.txt",sep=""),
                            colClasses="character")
        
        ## 1.3 Read labels
        labels.y<-   read.table(paste(ir.ma,"/activity_labels.txt",sep=""),
                                colClasses="character")
        
        ## 2 Read of the test data frame
        
        ## 2.1 Read of the labels vector
        te<-paste(ir.ma,ir.te,sep="")
        read.te.y<-read.table(paste(te,"/y_test.txt",sep=""))
        ## 2.1.1 Assign the names to the test data.frame x
        names(read.te.y)<-"Activity_Labels"
        ## 2.1.2 Assign Activity labels for test data frame
        read.te.y[,1]<-as.character(read.te.y[,1])        
        read.te.y[,1]<-as.factor(read.te.y[,1])
        levels(read.te.y[,1])<-c(labels.y[1:6,2])
        ## 2.2 Read of the subject vector        
        read.te.s<-read.table(paste(te,"/subject_test.txt",sep=""))
        ## 2.2.1 Assign of the name to the "Subject Vector"
        names(read.te.s)<-"Subject"
        ## 2.3 Read of the Test Values
        read.te.x<-read.table(paste(te,"/X_test.txt",sep=""))
        ## 2.4 Assign the names to the test data.frame x
        for(i in 1:ncol(read.te.x)){names(read.te.x)[i]<-names.x[i,2]}
        ## 2.5 Creation of the Test Data Frame
        read.te<-data.frame(read.te.y,read.te.s,read.te.x)
        
        ## 3 Read of the train data frame
        
        ## 3.1 Read of the labels vector
        tr<-paste(ir.ma,ir.tr,sep="")
        read.tr.y<-read.table(paste(tr,"/y_train.txt",sep=""))
        ## 3.1.1 Assign the names to the train data.frame x              
        names(read.tr.y)<-"Activity_Labels"
        ## 3.1.2 Assign Activity labels for train data frame
        read.tr.y[,1]<-as.character(read.tr.y[,1])
        read.tr.y[,1]<-as.factor(read.tr.y[,1])
        levels(read.tr.y[,1])<-c(labels.y[1:6,2])
        ## 3.2 Read of the subject vector                
        read.tr.s<-read.table(paste(tr,"/subject_train.txt",sep=""))
        ## 3.2.1 Assign of the name to the "Subject Vector"     
        names(read.tr.s)<-"Subject"
        ## 3.3 Read of the Train Values        
        read.tr.x<-read.table(paste(tr,"/X_train.txt",sep=""))
        ## 3.4 Assign the names to the train data.frame x        
        for(i in 1:ncol(read.tr.x)){names(read.tr.x)[i]<-names.x[i,2]}
        ## 3.5 Creation of the Train Data Frame
        read.tr<-data.frame(read.tr.y,read.tr.s,read.tr.x)
        
        ## 4 Merge Data
        read.all<-rbind(read.tr,read.te)
        
        ## 5 Selection of the variables with mean() and std()
        
        ## 5.1 Creation of a logical vector to select the right columns        
        names.test<-grepl("-mean\\(\\)|-std\\(\\)",names.x[,2])
        names.test<-c(T,T,names.test)
        names.test<-as.logical(names.test)
        ## 5.2 subset the columns with just "mean" or "sd" values
        read.subset<-read.all[,names.test]
        
        ## 6 Order the data with a list
        ## Create a list, with every element as variable 
        ## and in every element a matrix with the average results
        ## of Activity Vs. Subject
        read.list<-list()
        for(i in 1:(length(names(read.subset))-2)){
                read.list[[i]]<-tapply(read.subset[,i+2],
                                       list(read.subset[,2],read.subset[,1]),mean)
        }
        
        ## 7 Creation of the Final Data Frame with the tidy data
        
        ## 7.1 Assign the index values
        ## The first column signal the Activities
        ## Per every set of activities (6 records) is assigned 
        ## a subject, in the seconf column.
        read.final<-data.frame(Activity=rep(labels.y[,2],each=30),Subject=rep(1:30,len=180))
        
        ## 7.2 Assign the record for every index
        for(i in 1:(length(names(read.subset))-2)){
                vec.help<-numeric()
                for(u in 1:6){
                        vec.help<-c(vec.help,read.list[[i]][,u])
                }
                read.final[,i+2]<-vec.help
        }
        
        ## 7.2.1 Assign the names to the tidy data
        names(read.final)<-names(read.subset)
        
        ## 8 Write the tidy data in a "txt" file
        write.table(read.final,"run_analysis.txt",sep=",",row.names=F)
        
        ## 8.1 Assign the tidy data to the value of the function
        read.final
    }