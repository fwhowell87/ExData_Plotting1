## This code reads in the household power consumption data and plots a histogram
## of 'Global Active Power' over the 1st and 2nd February 2007

## Install readr package

install.packages("readr")
library(readr)

## Read in data from txt file and reduce to two required dates

data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007")]

## Set up png file and plot histogram

png(file="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()