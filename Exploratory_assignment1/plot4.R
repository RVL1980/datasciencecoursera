## sourcce the helper function GetData.R
source("GetData.R")


Plot4<-function(){
## This function creates plot1.png with requested data
  
  ## call helperfunction to read in data
  data<-GetData()
  ## convert timestamp to actual usable one
  data$Timestamp<-strptime(data$Timestamp,"%Y-%m-%d %H:%M:%S")
  ## open PNG device for plotting
  png(filename="plot4.png",width=480,height=480,units="px")
  ## define 2x2 graphs
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    with(data, {
      plot(Timestamp, Global_active_power, xlab="", ylab="Global Active Power", type="l")
      plot(Timestamp, Voltage, xlab="datetime",ylab="Voltage",type="l")
      plot(Timestamp, Sub_metering_1,xlab="",ylab="Energy sub metering", type="l")
      lines(Timestamp,Sub_metering_2, type="l", col="red")
      lines(Timestamp,Sub_metering_3, type="l", col="blue")
      legend("topright",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
      plot(Timestamp,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
    })
  ## close PNG device
  dev.off()
}
## Call function to create Plot1
Plot4()