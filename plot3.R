## read the data
data <- read.table("/Users/Kevin/household_power_consumption.txt",sep=";", 
                   header=T, na.strings="?")
## subset the data and name the subset dataframe as "newd"
newd<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## perform conversions on data and time values
newd$Datetime <- strptime(paste(newd$Date, newd$Time), "%d/%m/%Y %H:%M:%S")

## create plot3
plot(newd$Datetime, newd$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(newd$Datetime, newd$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(newd$Datetime, newd$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(newd$Datetime, newd$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## When I used Rstudio to export is as 480*480, I found some text was left out in the photo. I also added text.width=50000 as some people suggested in the forum. But again, it didn't work.Therefore, I decided to export it as the default size. And then I modified the picture using sips command line on Terminal. PLEASE WRITE DOWN HOW YOU DEALT WITH THE ISSUE IF YOU HAVE BETTER SOLUTION. THANKS!