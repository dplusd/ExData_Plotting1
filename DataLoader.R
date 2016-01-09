
loadData <- function() {
    if(exists("hpcDataset")) {
        return (hpcDataset)
    }
    
    fileHandle <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
    top1000Lines <-read.table(fileHandle, header=T, quote="\"", sep=";", na.strings="?", nrows=1000)
    
    numOfMB <- as.integer((object.size(top1000Lines) / 1000.0 *  2075259) / (1024^2))
    print(paste("Full file size", numOfMB, "MB"))
    
    
    fileHandle <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
    lines <- grep("^[12]/2/2007.*", readLines(fileHandle))
    
    startLine <- min(lines)
    lineCount <- max(lines) - min(lines) + 1
    fileHandle <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
    dataSet <- read.table(fileHandle, col.names = names(top1000Lines), header=F, quote="\"", sep=";", na.strings="?", skip=startLine, nrows=lineCount)
    
    if (length(lines) !=dim(dataSet)[1]) {
        print("Error")
    }
    
    dataSet$DateTime <- strptime(paste(dataSet$Date,dataSet$Time), format="%d/%m/%Y %H:%M:%S")
    dataSet$Date <- NULL
    dataSet$Time <- NULL
    hpcDataset <<-list(SizeMB = numOfMB, data = dataSet)
    closeAllConnections()
    return(hpcDataset)
}