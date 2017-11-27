full_data <- read.table("./data/household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na="?")

data <- full_data[(full_data$Date=="1/2/2007") | (full_data$Date=="2/2/2007"),]

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

plot(data$Time, data$Sub_metering_1,  
     xlab="",
     ylab="Energy Sub metering" ,type="l")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")

legend("topright" , col =c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()