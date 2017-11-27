full_data <- read.table("./data/household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na="?")

data <- full_data[(full_data$Date=="1/2/2007") | (full_data$Date=="2/2/2007"),]

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

plot(data$Time, data$Global_active_power ,  xlab="",
     ylab="Global Active Power (kilowatts)" ,type="l")
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()