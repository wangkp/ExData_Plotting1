## read the data
data <- read.table("/Users/Kevin/household_power_consumption.txt",sep=";", 
                   header=T, na.strings="?")
## subset the data and name the subset dataframe as "newd"
newd<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## perform conversions on data and time values
newd$Datetime <- strptime(paste(newd$Date, newd$Time), "%d/%m/%Y %H:%M:%S")

## create plot1
png("plot1.png",width=480,height=480)
hist(newd$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
     1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()