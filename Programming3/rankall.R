rankall<-function(outcome,num="best"){
## This function returns a list of the hospital ranked on position NUM in each state for condition OUTCOME  
  
## read data
  data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
  ## filter to relevant columns
  data<-data[c(2,7,11,17,23)]
  ## get list of all states available and order alphabetically (used later on in loop)
  states<-data[,2]
  states<-unique(states)
  states<-states[order(states)]
  
## create helper function that returns the hospital name of a certain ranking and the state its in 
  rankhospital2<-function(state,outcome2,num2="best"){  
  ## check validity of outcome string
    if (outcome2!= "heart attack" && outcome2!="heart failure" && outcome2!="pneumonia"){
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

  ## subset to keep only rows from that state without the Not Available
  data.subset<-data[data$state==state & data[,outcome2]!="Not Available",]
  ## convert data to numeric values
  data.subset[,outcome2]<-as.numeric(data.subset[,outcome2])

  ##order list
  ordereddata<-data.subset[order(data.subset[,outcome2],data.subset[,1]),]
  if (num2=="best"){
    num2=1
  }
  if (num2=="worst"){  
    num2=nrow(ordereddata)
  }

  namestate<-data.frame()
  namestate[1,1]<-(ordereddata[num2,1])
  namestate[1,2]<-state
  ## return namestate which has the name and state of the hospital ranked
  return(namestate)
  }

## Create dataframe in which all data ends up
alldata <- data.frame("hospital"=character(), "state"=character())
## FOR-loop to run function rankhospital2 for each state
  for (st in states) {
    namestate <- rankhospital2(st, outcome, num)
  ## Add row of data to dataframe for each for-iteration
    alldata <- rbind(alldata, data.frame(hospital=namestate[1,1], state=namestate[1,2]))
  }

## output final dataframe
return(alldata)
}