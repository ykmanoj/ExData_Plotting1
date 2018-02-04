setwd("~/work/Github_workspace/R-Learning/datasciencecoursera/ExData_Plotting1/")
if (file.exists("./household_power_consumption.txt")) {
  data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c(rep("character", 2), rep("numeric", 7)),stringsAsFactors = FALSE,dec = ".")
  rangeData  <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  #Sprint(summary(rangeData))
  rangeData$DateTime <- strptime(paste(rangeData$Date,rangeData$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
  #print(summary(transformedData))
  png("Plot2.png", width=480, height=480)
  plot(rangeData$DateTime, rangeData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}else{
  print("No file found")
}
