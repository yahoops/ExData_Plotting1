
file<- read.table("household_power_consumption.txt", sep=";", na.string="?",header=TRUE)
file[,"Date"]<-as.Date(file[,"Date"],"%d/%m/%Y")
file<-subset(file,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
hist(file$Global_active_power,col="red",xlab="Global active power(kilowatts)",main="Global active power")
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()
