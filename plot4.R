## read the data
data <- read.table("/Users/Kevin/household_power_consumption.txt",sep=";", 
                   header=T, na.strings="?")
## subset the data and name the subset dataframe as "newd"
newd<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## perform conversions on data and time values
newd$Datetime <- strptime(paste(newd$Date, newd$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

## plot NW
plot(newd$Datetime, newd$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## plot NE
plot(newd$Datetime, newd$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## plot SW
plot(newd$Datetime, newd$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
    xlab = "", col = "black")
points(newd$Datetime, newd$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(newd$Datetime, newd$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

## plot 4 SE
plot(newd$Datetime, newd$Global_reactive_power, type = "l", xlab = "datetime", 
    ylab = "Global_reactive_power", ylim = c(0, 0.5))