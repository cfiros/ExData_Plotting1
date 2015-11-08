## read all data and filter on the requested dates change clomuns for comforable use.
household <- read.csv("household_power_consumption.txt",sep = ";")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]
full_time <- strptime(paste(household$Date, household$Time), format = "%Y-%m-%d %H:%M:%S")
household$Global_active_power <- as.numeric(household$Global_active_power)

## change plotting device.
graphics.off()
bmp("plot2.bmp")

## creating the plot using plot, axis and lines.
plot(full_time,household$Global_active_power, ylab = "Global Active Power (kilowatts)",yaxt='n',xlab = "",type = 'n')
axis(side=2, at=seq(0,3000, 1000), labels=seq(0,6,2))
lines(full_time, household$Global_active_power)

## close plotting device.
graphics.off()
