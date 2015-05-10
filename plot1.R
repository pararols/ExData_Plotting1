dades<-read.csv("household_power_consumption.txt",sep=";")
dades2<-dades
dades$Date<-as.Date(dades$Date,"%d/%m/%Y")
dades<-dades[dades$Date>=as.Date("01/02/2007","%d/%m/%Y"),]
dades<-dades[dades$Date<=as.Date("02/02/2007","%d/%m/%Y"),]
dades$Global_active_power<-as.numeric(dades$Global_active_power)
dades$Global_active_power<-dades$Global_active_power/1000
hist(dades$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()