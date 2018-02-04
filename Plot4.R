setwd("~/work/Github_workspace/R-Learning/datasciencecoursera/ExData_Plotting1/")
if (file.exists("./household_power_consumption.txt")) {
  data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c(rep("character", 2), rep("numeric", 7)),stringsAsFactors = FALSE,dec = ".")
  rangeData  <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  #Sprint(summary(rangeData))
  rangeData$DateTime <- strptime(paste(rangeData$Date,rangeData$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
  #print(summary(transformedData))
  png("Plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  
  plot(rangeData$DateTime, rangeData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  plot(rangeData$DateTime, rangeData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(rangeData$DateTime, rangeData$Sub_metering_1, type = "l", ylab = "Energy Sub metering",xlab = "")
  lines(rangeData$DateTime,rangeData$Sub_metering_2, col="red" , type = "l")
  lines(rangeData$DateTime,rangeData$Sub_metering_3, col="blue", type = "l")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  
  plot(rangeData$DateTime, rangeData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  
  dev.off()
}else{
  print("No file found")
}
