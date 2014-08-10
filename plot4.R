file<- read.table("household_power_consumption.txt", sep=";", na.string="?",header=TRUE)
file[,"Date"]<-as.Date(file[,"Date"],"%d/%m/%Y")
file<-subset(file,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data<-file
par(mfrow = c(2,2))


#first
plot(as.POSIXct(paste(file$Date, file$Time)),file$Global_active_power,ylab="Global Active Power",xlab="",type="l")
#second
plot(as.POSIXct(paste(file$Date, file$Time)),file$Voltage,ylab="Voltage",xlab="datetime",type="l")
#third
plot(as.POSIXct(paste(file$Date, file$Time)),file$Sub_metering_1,ylab="Energy sub metering",xlab="", type = "l")
lines(as.POSIXct(paste(file$Date, file$Time)),file$Sub_metering_2, col = "red")
lines(as.POSIXct(paste(file$Date, file$Time)),file$Sub_metering_3, col = "blue")
legend("topright", pch =-1, lty = 1, lwd =2.5, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#last
plot(as.POSIXct(paste(file$Date, file$Time)),data$Global_active_power, xlab="datetime",type="l")

dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()

