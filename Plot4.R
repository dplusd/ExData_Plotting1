source("DataLoader.R")

#load data
data <- loadData()$data
    

#open target file
png("plot4.png")

#set num of plots (2X2)
par(mfrow = c(2, 2))

#global active power
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Ative Power (kilowatts)", xlab="")

#voltage
plot(data$DateTime, data$Voltage, type="l", ylab="Voltage", xlab="")

#Sub_metering
plot(data$DateTime, apply(data[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], 1, max), type="n", ylab="Global Ative Power (kilowatts)", xlab="")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2,col="blue")
lines(data$DateTime, data$Sub_metering_3, col="red")
legend("topright", lwd=2, col=c("black", "blue", "red"), legend=c("Sub_mastering_1", "Sub_mastering_2", "Sub_mastering_3"))

#Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="")

#close device
dev.off()


