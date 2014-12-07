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

# Plot graphs per instructions
png("plot4.png",width = 480, height = 480)
par(mfcol = c(2,2))
plot(projdata$DT,as.numeric(projdata$Global_active_power),type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")

plot(projdata$DT,as.numeric(projdata$Sub_metering_1),type="l",ylab= "Energy Sub Metering", xlab = "")
points(projdata$DT,as.numeric(projdata$Sub_metering_2),type="l", col = "Red")
points(projdata$DT,as.numeric(projdata$Sub_metering_3),type="l", col = "Blue")
legend("topright",pch = "-", lwd= 3,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(projdata$DT,as.numeric(projdata$Voltage),type="l",ylab = "Voltage", xlab = "datetime")
plot(projdata$DT,as.numeric(projdata$Global_reactive_power),type="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()