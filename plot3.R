housepower<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
householdpower<-housepower[(housepower$Date == "2/2/2007" | housepower$Date == "1/2/2007" ),]
Sub_metering_1<-as.numeric(as.character(householdpower$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(householdpower$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(householdpower$Sub_metering_3))


png(filename = "plot3.png")
plot(Sub_metering_1, type = "n", axes = FALSE, ylab = "Enegy sub metering", xlab = "" )
lines(Sub_metering_1)
lines(Sub_metering_2, col = "Red")
lines(Sub_metering_3, col = "Blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
box()
legend("topright",col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1))
dev.off()
