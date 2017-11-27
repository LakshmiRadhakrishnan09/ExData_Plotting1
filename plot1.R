full_data <- read.table("./data/household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na="?")

data <- full_data[(full_data$Date=="1/2/2007") | (full_data$Date=="2/2/2007"),]

hist(data$Global_active_power , main="Global Active Power" , col="red" , xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
