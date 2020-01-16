## This code reads in the household power consumption data and creates a timeseries
## plot of the 3 'Energy sub metering' datasets over the 1st and 2nd February 2007

## Install readr package

install.packages("readr")
library(readr)

## Read in data from txt file and reduce to two required dates

data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007")]

## Create a composite variable of date and time which can be used to plot timeseries

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Set up png file

png(file="plot3.png", width = 480, height = 480)

## Create plot window and first timeseries

plot(datetime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering")

## Add 2 more timeseries to same plot

lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")

## Create legend

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)

dev.off()