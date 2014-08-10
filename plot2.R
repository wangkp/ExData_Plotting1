## read the data
data <- read.table("/Users/Kevin/household_power_consumption.txt",sep=";", 
                   header=T, na.strings="?")
## subset the data and name the subset dataframe as "newd"
newd<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## perform conversions on data and time values
newd$Datetime <- strptime(paste(newd$Date, newd$Time), "%d/%m/%Y %H:%M:%S")

## create plot2
png("plot2.png",width=480,height=480)
plot(newd$Datetime, newd$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()