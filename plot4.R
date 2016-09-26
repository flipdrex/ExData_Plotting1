housepower<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
householdpower<-housepower[(housepower$Date == "2/2/2007" | housepower$Date == "1/2/2007" ),]

globalave<-as.numeric(as.character(householdpower$Global_active_power))
Sub_metering_1<-as.numeric(as.character(householdpower$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(householdpower$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(householdpower$Sub_metering_3))
voltage<-as.numeric(as.character(householdpower$Voltage))
Global_reactive_power<-as.numeric(as.character(householdpower$Global_reactive_power))


png(filename = "plot4.png")
par(mfrow = c(2, 2))
#Global Average
plot(globalave, type = "n", axes = FALSE, ylab = "Global Active Power (kilowatts)", xlab = "" )
lines(globalave)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6))
box()

#Voltage
plot(voltage, type = "n", axes = FALSE, ylab = "Voltage", xlab = "datetime" )
lines(voltage)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(234,236,238,240,242,244,246))
box()


#Sub Metering
plot(Sub_metering_1, type = "n", axes = FALSE, ylab = "Enegy sub metering", xlab = "" )
lines(Sub_metering_1)
lines(Sub_metering_2, col = "Red")
lines(Sub_metering_3, col = "Blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
box()
legend("topright",col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1))

#Global Reactive Power
plot(Global_reactive_power, type = "n", axes = FALSE, ylab = "Global_reactive_power", xlab = "datetime" )
lines(Global_reactive_power)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0.1,0.2,0.3,0.4,0.5))
box()
dev.off()