best<-function(state,outcome){
## This function returns the name of the hospital with the
## best (i.e. lowest) death rate in its STATE for a certain OUTCOME
## The data-file used is hospital-data.csv, which should be in the working folder
## Example run: best("IL","heart attack")
  

## check validity of OUTCOME string
  if (outcome!= "heart attack" && outcome!="heart failure" && outcome!="pneumonia"){
    stop("invalid outcome")
  }  

## read data
data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
## filter to relevant columns
data<-data[c(2,7,11,17,23)]
## change names of columns
colnames(data)<-c("name","state","heart attack","heart failure","pneumonia")

## check validity of state name
  if (!(state %in% data$state)){
    stop("invalid state")
  }

## subset data to keep only rows from that state without the "Not Available" rows
data.subset<-data[data$state==state & data[,outcome]!="Not Available",]
## convert data to numeric values
data.subset[,outcome]<-as.numeric(data.subset[,outcome])

##determine lowest death rate
lowest<-min(data.subset[,outcome])
## give name of hospital with lowest death rate
return(data.subset[data.subset[,outcome]==lowest,1])
}

