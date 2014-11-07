
GetData<-function(){
## This function is a helper function and reads the data, subsets it and 
## caches the data as a csv-file.  
  
## check whether the data file was already cached. If not, read data file  
  if (!file.exists("cached_data.csv")){
    ## read in .txt file
    data_all<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    ## only keep the subset of dates needed
    data<-data_all[(data_all$Date=="1/2/2007")|(data_all$Date=="2/2/2007"),]
    ## create timestamp column with date and time combined
    data$Timestamp<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
    ## cache data as .csv file for use by other functions 
    write.csv(data,"cached_data.csv")
  }
  else {
    ## if file was already cached, read out data 
    data<-read.csv("cached_data.csv")
  }
## return data as output  
data
}