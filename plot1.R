plot1 <- function() {
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
  png("plot1.png")
  hist(data$Global_active_power[datemask], col="red", main="Global Active Power",
       xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  dev.off()
}
