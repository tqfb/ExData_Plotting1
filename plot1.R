# Import data and subset to the two days we want to look at.
# Set all values as numeric.  The conversion here is a bit wonky, if I had
# more time, I'd figure out why I needed to do this in this way
house <- read.table("./household_power_consumption.txt",sep=";",header = TRUE)
projdata <- house[(house$Date == "1/2/2007" | house$Date == "2/2/2007"),]
projdata$Date <- as.Date(strptime(projdata$Date,"%d/%m/%Y"))
projdata$DT <- strptime(paste(projdata$Date, projdata$Time),"%Y-%m-%d %H:%M:%S")
projdata$Global_active_power <- as.numeric(as.character(projdata$Global_active_power))
projdata$Global_reactive_power <- as.numeric(as.character(projdata$Global_reactive_power))
projdata$Voltage <- as.numeric(as.character(projdata$Voltage))
projdata$Sub_metering_1 <- as.numeric(as.character(projdata$Sub_metering_1))
projdata$Sub_metering_2 <- as.numeric(as.character(projdata$Sub_metering_2))
projdata$Sub_metering_3 <- as.numeric(as.character(projdata$Sub_metering_3))

png("plot1.png",width = 480, height = 480)
hist(as.numeric(projdata$Global_active_power),xlab = "Global Active Power (kilowatts)",col = "Red",main = "Global Active Power")
dev.off()