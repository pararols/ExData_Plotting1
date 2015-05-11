dades<-read.csv("household_power_consumption.txt",sep=";") #read data
dades2<-dades
na.strings = "?"
dades$Date<-as.Date(dades$Date,"%d/%m/%Y") #convert date to date type
dades<-dades[dades$Date>=as.Date("01/02/2007","%d/%m/%Y"),] #subset range
dades<-dades[dades$Date<=as.Date("02/02/2007","%d/%m/%Y"),] #subset range of dates
datetime <- paste(dades$Date, dades$Time) #arrange date and time
datetime2<- strptime(datetime,"%Y-%m-%d %H:%M:%S") #set data and time type
#plot nº1 global active power
dades$Global_active_power<-as.numeric(paste(dades$Global_active_power))
par(mfrow=c(2,2))
plot(datetime2,dades$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#plot nº2 voltage
dades$Voltage<-as.numeric(paste(dades$Voltage))
plot(datetime2,dades$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot nº3 energy sub meterinr
dades$Sub_metering_1<-as.numeric(dades$Sub_metering_1)
dades$Sub_metering_2<-as.numeric(dades$Sub_metering_2)
dades$Sub_metering_3<-as.numeric(dades$Sub_metering_3)
plot(datetime2,dades$Sub_metering_1,type="l",xlab="",ylab="Energy Submetering")
lines(datetime2,dades$Sub_metering_2,type="l",col="red")
lines(datetime2,dades$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)
#plot nº4 global reactive power
dades$Global_reactive_power<-as.numeric(paste(dades$Global_reactive_power))
plot(datetime2,dades$Global_reactive_power,type="l",xlab="datetime",ylab="Voltage")
dev.copy(png, file = "plot4.png")
dev.off()