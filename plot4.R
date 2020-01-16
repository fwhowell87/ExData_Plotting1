## This code reads in the household power consumption data and creates 4 timeseries 
## plots for the 1st and 2nd February 2007, for 'Global Active Power', Voltage, the 3 
## 'Energy sub metering' datasets and 'Global reactive power'

## Install readr package

install.packages("readr")
library(readr)

## Read in data from txt file and reduce to two required dates

data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007")]

## Create a composite variable of date and time which can be used to plot timeseries

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Set up png file

png(file="plot4.png", width = 480, height = 480)

## Create 2x2 plotting window

par(mfrow=c(2,2))

## Create 4 timeseries plots

plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1,bty="n")

plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()