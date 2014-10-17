complete <- function(directory, id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

## create empty dataframe for storing relevant data with a column for the 
## monitor IDs and one for the number of cases  

casesframe<-data.frame(id=vector(), nobs=vector())
## set index i to 1
i<-1

## Loop over the monitor IDs
  for (d in id){

    ## Make sure 1 or 2 zeros are added to filename depending on ID number
    if (d<10) {file<-paste(directory,"/00",d,".csv", sep="")}
    else if ((d>9) & (d<100)) {file<-paste(directory,"/0",d,".csv", sep="")}
    else {file<-paste(directory,"/",d,".csv", sep="")}              

    ## read in monitor-data
    data<-read.csv(file)
    ## calculate number of complete cases in file
    numcases<-sum(complete.cases(data))
    ## store monitor ID as character in column id of dataframe
    casesframe[i,1]<-as.character(d)
    ## store # cases in column nobs of dtaframe
    casesframe[i,2]<-numcases
    ## go to next row of dataframe
    i<-i+1
  }
## outpu final dataframe
return(casesframe)
}
