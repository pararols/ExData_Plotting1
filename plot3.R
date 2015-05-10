dades<-read.csv("household_power_consumption.txt",sep=";")
dades2<-dades
dades$Date<-as.Date(dades$Date,"%d/%m/%Y")
dades<-dades[dades$Date>=as.Date("01/02/2007","%d/%m/%Y"),]
dades<-dades[dades$Date<=as.Date("02/02/2007","%d/%m/%Y"),]
datetime <- paste(dades$Date, dades$Time)
datetime2<- strptime(datetime,"%Y-%m-%d %H:%M:%S")
dades$Sub_metering_1<-as.numeric(dades$Sub_metering_1)
dades$Sub_metering_2<-as.numeric(dades$Sub_metering_2)
dades$Sub_metering_3<-as.numeric(dades$Sub_metering_3)
dades$Global_active_power<-dades$Global_active_power/1000
plot(datetime2,dades$Sub_metering_1,type="l",xlab="",ylab="Energy Submetering")
lines(datetime2,dades$Sub_metering_2,type="l",col="red")
lines(datetime2,dades$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),seg.len=1)
dev.copy(png, file = "plot3.png")
dev.off()