plot3 <- function() {
  data <- read.table("household_power_consumption.txt", sep = ";",
                     col.names = c("Date", "Time", "Global_active_power",
                                   "Global_reactive_power", "Voltage", "Global_intensity",
                                   "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                     colClasses = c("character", "character", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     nrows = 5000, skip = 65000, na.strings = "?") #70k max, 65k min
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data$Time <- paste(data$Date, data$Time)
  data$Time <- strptime(data$Time, format = "%Y-%m-%d %H:%M:%S")
  datemask <- data$Date > as.Date("2007-01-31") & data$Date < as.Date("2007-02-03")
  png("plot3.png")
  plot(data$Time[datemask], data$Sub_metering_1[datemask],
       type="n", xlab="", ylab="Energy sub metering")
  lines(data$Time[datemask], data$Sub_metering_1[datemask])
  lines(data$Time[datemask], data$Sub_metering_2[datemask], col="red")
  lines(data$Time[datemask], data$Sub_metering_3[datemask], col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1, col=c("black","red","blue"))
  dev.off()
}