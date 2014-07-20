activity<-read.csv("activity.csv",colClasses=c("numeric","POSIXct","numeric"))

activitymean<-tapply(activity$steps,activity$date,mean,na.rm=F)