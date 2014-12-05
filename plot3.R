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
#make plots
plot(epcSub$Sub_metering_1,pch=27,xlab="",ylab="Energy sub metering (WH)",axes=FALSE)
lines(epcSub$Sub_metering_1,lwd=1,col="black")
lines(epcSub$Sub_metering_2,lwd=1,col="red")
lines(epcSub$Sub_metering_3,lwd=1,col="darkorchid3") #Can't get that purple quite right...
legend("topright",cex=.7,lty="solid",col=c("black","red","darkorchid3"),legend=names(epcSub[,7:9]))
axis(2)
ticks = c(1,nrow(epcSub)/2,nrow(epcSub))
xlabels = c("Thu","Fri","Sat")
axis(1,at=ticks,labels=xlabels)
box(lty = "solid")
#write png 480x480
dev.copy(png,"plot3.png") #480x480 default device size
dev.off()