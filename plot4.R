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
png(filename = "plot4.png",
    width = 480, height = 480)
par(mfrow = c(2,2))
plot(newData$DateTime,
     newData$Global_active_power,
     type = "l",
     xlab="",
     ylab="Global Active Power")
plot(newData$DateTime,
     newData$Voltage,
     type = "l",
     xlab= "datetime",
     ylab= "Voltage")
plot(newData$DateTime,
     newData$Sub_metering_1,
     type = "l",
     xlab= "",
     ylab= "Energy sub metering")
lines(newData$DateTime,
      newData$Sub_metering_2,
      col = "red")
lines(newData$DateTime,
      newData$Sub_metering_3,
      col = "blue")
legend("topright",
       col= c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd = 1,
       bty = "n",
       cex = 0.8)
plot(newData$DateTime,
     newData$Global_reactive_power,
     type = "l",
     xlab= "datetime",
     ylab= "Global Reactive Power")
dev.off()