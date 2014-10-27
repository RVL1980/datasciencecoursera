rankhospital<-function(state,outcome,num="best"){
## This function returns the name of the hospital that is ranked
## at position NUM in its STATE for a certain OUTCOME
## In case of a tie, hospitals are ordered alphabetically
## Example run: rankhospital("IL","heart attack",5) gives the name of
## the hospital ranked #5 in Illinois in death rate due to heart attacks
  
## check validity of outcome string
  if (outcome!= "heart attack" && outcome!="heart failure" && outcome!="pneumonia"){
    stop("invalid outcome")
  }  

## read data. Data has to be read as Characters, otherwise it'll be read as factors and function won't work
data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
## filter to relevant columns
data<-data[c(2,7,11,17,23)]
## change names of columns
colnames(data)<-c("name","state","heart attack","heart failure","pneumonia")

## check validity of state name
  if (!(state %in% data$state)){
    stop("invalid state")
  }

## subset to keep only rows from that state without the Not Available
data.subset<-data[data$state==state & data[,outcome]!="Not Available",]
## convert data to numeric values
data.subset[,outcome]<-as.numeric(data.subset[,outcome])

##order list based on OUTCOME-value first, then alphabetically
ordereddata<-data.subset[order(data.subset[,outcome],data.subset[,1]),]
  ## convert best" and "worst" inputs to actual numbers
  if (num=="best"){
    num=1
  }
  if (num=="worst"){  
    num=nrow(ordereddata)
  }

# output the name of the hospital ranked at specified ranking in specified state
return(ordereddata[num,1])
}
