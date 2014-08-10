file<- read.table("household_power_consumption.txt", sep=";", na.string="?",header=TRUE)
file[,"Date"]<-as.Date(file[,"Date"],"%d/%m/%Y")
file<-subset(file,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
plot(as.POSIXct(paste(file$Date, file$Time)),data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()


