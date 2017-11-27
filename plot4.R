full_data <- read.table("./data/household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na="?")

data <- full_data[(full_data$Date=="1/2/2007") | (full_data$Date=="2/2/2007"),]

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

#plot 1
plot(data$Time, data$Global_active_power ,  xlab="",
     ylab="Global Active Power" ,type="l")

#plot 2
plot(data$Time, data$Voltage ,  xlab="datetime",
     ylab="Voltage" ,type="l")

#plot 3
plot(data$Time, data$Sub_metering_1,  
     xlab="",
     ylab="Energy Sub metering" ,type="l")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")

legend("topright" , col =c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,box.lwd=0)

#plot 4
plot(data$Time, data$Global_reactive_power,  xlab="datetime",
     ylab="Global_reactive_power" ,type="l")


# Copy to png devce type
dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()