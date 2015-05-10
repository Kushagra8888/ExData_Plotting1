createPlot3 <- function(filePath) {
  #Read from flat file
  epc_data2 <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");
  #Convert Dates to class Date
  epc_data2[,1] <- as.Date(epc_data2[,1], "%d/%m/%Y");
  #Subset part the data between the given two dates
  epc_subset2 <- subset(epc_data2, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"), );
  #Create datetime vector
  epc_subset2$datetime <- as.POSIXct(paste(epc_subset2$Date, epc_subset2$Time), format="%Y-%m-%d %H:%M:%S")
  #Open png device and plot the graph
  png(filename = "plot3.png", width = 480, height = 480);
  plot(epc_subset2$datetime, epc_subset2$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type="n")
  lines(epc_subset2$datetime, epc_subset2$Sub_metering_1)
  lines(epc_subset2$datetime, epc_subset2$Sub_metering_2, col = "red")
  lines(epc_subset2$datetime, epc_subset2$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "_")
  dev.off();
}