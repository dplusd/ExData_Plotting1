
source("DataLoader.R")


#load data
data <- loadData()$data
#one plot 
par(mfrow = c(1, 1))

#open target file
png("plot3.png" , width=480, height=480)

#init plot by estimating max value from each of three attribute attribute
plot(data$DateTime, apply(data[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], 1, max), type="n", ylab="Global Ative Power (kilowatts)", xlab="", mar=c(1, 4, 2, 2))
#draw lines
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2,col="blue")
lines(data$DateTime, data$Sub_metering_3, col="red")
#add legend
legend("topright", lwd=2, col=c("black", "blue", "red"), legend=c("Sub_mastering_1", "Sub_mastering_2", "Sub_mastering_3"))
#close device
dev.off()        
