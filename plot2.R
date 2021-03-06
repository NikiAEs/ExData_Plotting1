#read the data
mydata <- read.table("household_power_consumption.txt",
                     header = TRUE,
                     sep=";",
                     colClasses = c("character","character",rep("numeric",7)),
                     na = "?")
attach(mydata)
subset = Date == "1/2/2007" | Date == "2/2/2007"
newData = mydata[subset,]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)

#make the plot
png(filename = "plot2.png",
    width = 480, height = 480)
plot(newData$DateTime,
     newData$Global_active_power,
     type = "l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()