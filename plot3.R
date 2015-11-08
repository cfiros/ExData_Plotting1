## read all data and filter on the requested dates change clomuns for comforable use.
household <- read.csv("household_power_consumption.txt",sep = ";")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]
full_time <- strptime(paste(household$Date, household$Time), format = "%Y-%m-%d %H:%M:%S")
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)

## change plotting device.
graphics.off()
bmp("plot3.bmp")

## creating the plot using plot, axis, lines and legend.
plot(full_time,household$Sub_metering_1, ylab = "Energy Sub Metering",xlab = "",type = "n",yaxt = "n",ylim = c(0,40))
axis(side=2, at=c(0,10,20,30))
lines(full_time, household$Sub_metering_1)
lines(full_time, household$Sub_metering_2, col = "red")
lines(full_time, household$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue") ,lty = 1)

## close plotting device.
graphics.off()