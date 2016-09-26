housepower<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
householdpower<-housepower[(housepower$Date == "2/2/2007" | housepower$Date == "1/2/2007" ),]

globalave<-as.numeric(as.character(householdpower$Global_active_power))
png(filename = "plot1.png")
hist(globalave, col = "Red", ylim = c(0,1200), main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", cex.axis = .8)
dev.off()
