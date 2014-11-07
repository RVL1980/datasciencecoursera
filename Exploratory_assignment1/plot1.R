## sourcce the helper function GetData.R
source("GetData.R")



Plot1<-function(){
## This function creates plot1.png with requested data

  ## call helperfunction to read in data
  data<-GetData()
  ## open PNG device for plotting
  png(filename="plot1.png",width=480,height=480,units="px")
  ## create histogram
  hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
  ## close PNG device
  dev.off()
}
## Call function to create Plot1
Plot1()