#NOTE:  I added units to y-axis even though reference plot doesn't have them.
#This is a matter of principle.

#Set working directory to script's directory
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)
#read data,subset by date, and convert numeric from character
if(!exists("epcData")) epcData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
epcSub <- epcData[epcData$Date=="1/2/2007"|epcData$Date=="2/2/2007",]
epcSub$Sub_metering_1 <- as.numeric(gsub(" ","",epcSub$Sub_metering_1))
epcSub$Sub_metering_2 <- as.numeric(gsub(" ","",epcSub$Sub_metering_2))
epcSub$Sub_metering_3 <- as.numeric(gsub(" ","",epcSub$Sub_metering_3))
epcSub$Global_active_power <- as.numeric(gsub(" ","",epcSub$Global_active_power))
epcSub$Global_reactive_power <- as.numeric(gsub(" ","",epcSub$Global_reactive_power))
#make plots
ticks = c(1,nrow(epcSub)/2,nrow(epcSub))
xlabels = c("Thu","Fri","Sat")
par(mfrow=c(2,2))
par(cex=.6) #adjust text sizing, global
#Top Left
plot(epcSub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kW)",axes=FALSE)
axis(2)
axis(1,at=ticks,labels=xlabels)
box(lty="solid")
#Top Right
plot(as.numeric(gsub(" ","",epcSub$Voltage)),type="l",xlab="datetime",ylab="Voltage (volts)",axes=FALSE)
axis(2)
axis(1,at=ticks,labels=xlabels)
box(lty="solid")
#Bottom Left
plot(epcSub$Sub_metering_1,pch=27,ylab="Energy sub metering (WH)",axes=FALSE)
lines(epcSub$Sub_metering_1,lwd=.2,col="black")
lines(epcSub$Sub_metering_2,lwd=1,col="red")
lines(epcSub$Sub_metering_3,lwd=1,col="blue")
legend("topright",cex=1,lty="solid",box.lwd="NONE",col=c("black","red","blue"),legend=names(epcSub[,7:9]))
box(lty="solid")
axis(2)
axis(1,at=ticks,labels=xlabels)
#Bottom Right
plot(epcSub$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power (kW)",axes=FALSE)
axis(2)
axis(1,at=ticks,labels=xlabels)
box(lty="solid")

par(mfrow=c(1,1)) #this is a global setting :)
par(cex=1)#undo

#write png 480x480
dev.copy(png,"plot4.png") #480x480 default device size
dev.off()