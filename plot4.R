## read all data and filter on the requested dates change clomuns for comforable use.
household <- read.csv("household_power_consumption.txt",sep = ";")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]
full_time <- strptime(paste(household$Date, household$Time), format = "%Y-%m-%d %H:%M:%S")
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Voltage <- as.numeric(as.character(household$Voltage))
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)
household$Global_reactive_power <- as.numeric(as.character(household$Global_reactive_power))

## change plotting device.
graphics.off()
bmp("plot4.bmp")

## creating the plots using plot axis lines and legend.
par(mfrow=c(2,2))

plot(full_time,household$Global_active_power, ylab = "Global Active Power (kilowatts)",yaxt='n',xlab = "",type = 'n')
axis(side=2, at=seq(0,3000, 1000), labels=seq(0,6,2))
lines(full_time, household$Global_active_power)

plot(full_time,household$Voltage, ylab = "Voltage",xlab = "",yaxt='n',type = 'n')
axis(side=2, at=c(234,238,242,246))
lines(full_time, household$Voltage)

plot(full_time,household$Sub_metering_1, ylab = "Energy Sub Metering",xlab = "",type = "n",yaxt = "n",ylim = c(0,40))
axis(side=2, at=c(0,10,20,30))
lines(full_time, household$Sub_metering_1)
lines(full_time, household$Sub_metering_2, col = "red")
lines(full_time, household$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue") ,lty = 1,bty="n")

plot(full_time,household$Global_reactive_power, ylab = "Global_reactive_power",xlab = "datetime",type = "n")
lines(full_time, household$Global_reactive_power)

## close plotting device.
graphics.off()
