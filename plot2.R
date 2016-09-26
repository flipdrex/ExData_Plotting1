housepower<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
householdpower<-housepower[(housepower$Date == "2/2/2007" | housepower$Date == "1/2/2007" ),]
globalave<-as.numeric(as.character(householdpower$Global_active_power))


png(filename = "plot2.png")
plot(globalave, type = "n", axes = FALSE, ylab = "Global Active Power (kilowatts)", xlab = "" )
lines(globalave)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6))
box()
dev.off()

