createPlot2 <- function(filePath) {
  #Read from flat file
  epc_data <- read.table(file = filePath, header = TRUE, sep = ";");
  #Convert Dates to class Date
  epc_data[,1] <- as.Date(epc_data[,1], "%d/%m/%Y");
  #Subset part the data between the given two dates
  epc_subset <- subset(epc_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"), );
  #Convert Global_active_power to numeric values and remove N.As
  global_active_power <- as.numeric(levels(epc_subset$Global_active_power))[epc_subset$Global_active_power];
  global_active_power <- global_active_power[!is.na(global_active_power)];
  #Create datetime vector
  datetimes <- as.POSIXct(paste(epc_subset$Date, epc_subset$Time), format="%Y-%m-%d %H:%M:%S")
  #Open png device and plot the graph
  png(filename = "plot2.png", width = 480, height = 480);
  plot(datetimes, global_active_power, type="n", ylab = "Global Active Power(kilowatts)", xlab = "")
  lines(datetimes, global_active_power)
  dev.off();
}