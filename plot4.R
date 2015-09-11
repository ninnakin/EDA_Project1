## Code for plotting plot 4 for the first course project in the Exploratory Data Analysis Course

# Data for course project stored in household_power_consumption.txt (semi-colon-separated)

# Format for columns in read in data 
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


# Reading data from file
importdata <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")
feb.data <- subset(importdata,Date=="1/2/2007" |Date=="2/2/2007")
rm(importdata)

# Tidying the data
feb.data$Date <- as.Date(feb.data$Date,"%d/%m/%Y")
feb.data$datetime   <- strptime(paste(feb.data$Date,feb.data$Time),"%Y-%m-%d %H:%M:%S")

# construct third plot: All 3 submeterings over time

# open png device with width and height of 480 pixels
png(filename="plot4.png", width=480, height=480, units="px")
# change settings to english to get weekday names in english
Sys.setlocale("LC_TIME", "English")

# 2 rows and 2 columns of plots
par(mfrow=c(2,2))
    
# plot 1: the relationship between global active power and date
with(feb.data , plot(datetime, Global_active_power, type="l", xlab=""))

# plot 2: the relationship between voltage and date
with(feb.data , plot(datetime, Voltage, type="l"))

# plot 3: sub meterings relative to date
plot(feb.data$datetime,feb.data$Sub_metering_1,type="n", xlab = "", ylab= "")
lines(feb.data$datetime,feb.data$Sub_metering_1,col="black") 
lines(feb.data$datetime,feb.data$Sub_metering_2,col="red") 
lines(feb.data$datetime,feb.data$Sub_metering_3,col="blue") 
title(ylab="Energy sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black", "red", "blue"))

# plot 4: the relationship between global reactive power and date
with(feb.data , plot(datetime, Global_reactive_power, type="l"))

# close graphics device
dev.off()