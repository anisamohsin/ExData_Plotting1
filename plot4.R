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

# Drawing the plots
png("plot4.png")
par(mfrow = c(2,2), mar = c(4, 4, 2, 2), oma = c(0, 0, 2, 0))

#plot 1
with(twoDayFeb, plot(Time,as.numeric(as.character(Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")) 

#plot 2
with(twoDayFeb, plot(Time,as.numeric(as.character(Voltage)),type="l",xlab="datetime",ylab="Voltage")) 

#plot 3
with(twoDayFeb, plot(Time,as.numeric(as.character(Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")) 
with(twoDayFeb, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(twoDayFeb, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(twoDayFeb, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 4
with(twoDayFeb, plot(Time,as.numeric(as.character(Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")) 

dev.off()