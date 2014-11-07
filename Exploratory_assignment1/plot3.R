## sourcce the helper function GetData.R
source("GetData.R")


Plot3<-function(){
## This function creates plot1.png with requested data
  
  ## call helperfunction to read in data
  data<-GetData()
  ## open PNG device for plotting
  png(filename="plot3.png",width=480,height=480,units="px")
  ## convert timestamp to actual usable one
  data$Timestamp<-strptime(data$Timestamp,"%Y-%m-%d %H:%M:%S")
  ## plot data
  plot(data$Timestamp,data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
  lines(data$Timestamp,data$Sub_metering_2, type="l", col="red")
  lines(data$Timestamp,data$Sub_metering_3, type="l", col="blue")
  legend("topright",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  ## close PNG device
  dev.off()
}
## Call function to create Plot1
Plot3()