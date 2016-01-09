
source("DataLoader.R")

#load data
data <- loadData()$data
#one plot 
par(mfrow = c(1, 1))
#open device
png("plot2.png" , width=480, height=480)
#plot
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Ative Power (kilowatts)", xlab="", mar=c(1, 4, 2, 2), mfrow=c(1,1))
#close device
dev.off()        



