setwd("~/work/Github_workspace/R-Learning/datasciencecoursera/ExData_Plotting1/")
if (file.exists("./household_power_consumption.txt")) {
  data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c(rep("character", 2), rep("numeric", 7)),stringsAsFactors = FALSE,dec = ".")
  rangeData  <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  #Sprint(summary(rangeData))
  rangeData$DateTime <- strptime(paste(rangeData$Date,rangeData$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
  #print(summary(transformedData))
  png("Plot1.png", width=480, height=480)
  hist(rangeData$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200))
  dev.off()
}else{
  print("No file found")
  
}
