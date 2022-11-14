# Reading the power consumption data
EPConsumption <- read.table(file = "household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
EPConsumption$Date <- as.Date(EPConsumption$Date, "%d/%m/%Y")
EPConsumption$Time <- strptime(EPConsumption$Time, "%H:%M:%S")

#subseting the data for the two days 1st & 2nd of Feb 2007
twoDayFeb <- subset(EPConsumption, Date == "2007-02-01" | Date == "2007-02-02")

# calling the basic plot function
png("plot1.png")
with(twoDayFeb, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)", ylab = "Frequency"))
dev.off()