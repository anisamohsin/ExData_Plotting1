# Reading the power consumption data
EPConsumption <- read.table(file = "household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
EPConsumption$Date <- as.Date(EPConsumption$Date, "%d/%m/%Y")
EPConsumption$Time <- strptime(EPConsumption$Time, "%H:%M:%S")

#subseting the data for the two days 1st & 2nd of Feb 2007
twoDayFeb <- subset(EPConsumption, Date == "2007-02-01" | Date == "2007-02-02")

#Transforming the Time to have both Date & Time in one field
twoDayFeb[1:1440,"Time"] <- format(twoDayFeb[1:1440,"Time"],"2007-02-01 %H:%M:%S")
twoDayFeb[1441:2880,"Time"] <- format(twoDayFeb[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
png("plot2.png")
with(twoDayFeb, plot(Time,as.numeric(as.character(Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")) 
dev.off()