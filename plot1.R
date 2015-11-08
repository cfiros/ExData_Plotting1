## read all data and filter on the requested dates change clomuns for comforable use.
household <- read.csv("household_power_consumption.txt",sep = ";")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]
household$Global_active_power <- as.numeric(household$Global_active_power)

## change plotting device.
graphics.off()
bmp("plot1.bmp")

## plotting the histogram using hist and axis.
hist(household1$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",xaxt='n',
     main = "Global Active Power")
axis(side=1, at=seq(0,3000, 1000), labels=seq(0,6,2))

## close plotting device.
graphics.off()