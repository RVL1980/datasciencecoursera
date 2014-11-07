## sourcce the helper function GetData.R
source("GetData.R")


Plot2<-function(){
## This function creates plot1.png with requested data
  
  ## call helperfunction to read in data
  data<-GetData()
  ## open PNG device for plotting
  png(filename="plot2.png",width=480,height=480,units="px")
  ## convert timestamp to actual usable one
  data$Timestamp<-strptime(data$Timestamp,"%Y-%m-%d %H:%M:%S")
  ## plot data
  plot(data$Timestamp,data$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
  ## close PNG device
  dev.off()
}
## Call function to create Plot1
Plot2()