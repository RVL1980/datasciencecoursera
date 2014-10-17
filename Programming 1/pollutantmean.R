pollutantmean <- function(directory, pollutant="nitrate", id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

## create empty vector for storing relevant data  
alldata=vector()

## Loop over the monitor IDs
for (d in id){

  ## Make sure 1 or 2 zeros are added to filename depending on ID number
  if (d<10) {file<-paste(directory,"/00",d,".csv", sep="")}
  else if ((d>9) & (d<100)) {file<-paste(directory,"/0",d,".csv", sep="")}
  else {file<-paste(directory,"/",d,".csv", sep="")}              
  

  ## read in monitor-data
  data<-read.csv(file)
  
  ## select column and append pollutant-numbers to our vector
  alldata=c(alldata,data[,pollutant])
}

## calculate mean of pollutant data while ignoring NAs
result<-mean(alldata, na.rm=TRUE)
return(round(result,3))

}
