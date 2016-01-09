
source("DataLoader.R")


data <- loadData()$data
#one plot 
par(mfrow = c(1, 1))
png("plot1.png" , width=480, height=480)
hist(data$Global_active_power, col="darkorange2", mar=c(4,4,2,2), main="Global active power", xlab="Global active power (killowats)")
dev.off()        
