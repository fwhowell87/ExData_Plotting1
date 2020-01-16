## This code reads in the household power consumption data and creates a timeseries
## plot of 'Global Active Power' over the 1st and 2nd February 2007

## Install readr package

install.packages("readr")
library(readr)

## Read in data from txt file and reduce to two required dates

data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007")]

## Create a composite variable of date and time which can be used to plot timeseries

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Set up png file and plot timeseries

png(file="plot2.png", width = 480, height = 480)
plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()