dades<-read.csv("household_power_consumption.txt",sep=";")
dades2<-dades
dades$Date<-as.Date(dades$Date,"%d/%m/%Y")
dades<-dades[dades$Date>=as.Date("01/02/2007","%d/%m/%Y"),]
dades<-dades[dades$Date<=as.Date("02/02/2007","%d/%m/%Y"),]
datetime <- paste(dades$Date, dades$Time)
datetime2<- strptime(datetime,"%Y-%m-%d %H:%M:%S")
dades$Global_active_power<-as.numeric(dades$Global_active_power)
dades$Global_active_power<-dades$Global_active_power/1000
plot(datetime2,dades$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()