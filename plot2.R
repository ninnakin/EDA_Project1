## Code for plotting plot 2 for the first course project in the Exploratory Data Analysis Course

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

# construct second plot: Global Active Power in kW over time
# open png device with width and height of 480 pixels
png(filename="plot2.png", width=480, height=480, units="px")

# change settings to english to get weekday names in english
Sys.setlocale("LC_TIME", "English")

# adapt margins to fit with labels and title
par(mar=c(3,5,2,2))

# plot the relationship between global active power and date
plot(feb.data$datetime, feb.data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")

# close graphics device
dev.off()