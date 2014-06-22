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