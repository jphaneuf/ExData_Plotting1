#Set working directory to script's directory

script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)
#read data,subset by date, and convert numeric from character
if(!exists("epcData")) epcData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
epcSub <- epcData[epcData$Date=="1/2/2007"|epcData$Date=="2/2/2007",]
epcSub$Global_active_power <- as.numeric(gsub(" ","",epcSub$Global_active_power))
#make plot
plot(epcSub$Global_active_power,xlab="",pch=27,ylab="Global Active Power (kiloWatts)",axes=FALSE)
lines(epcSub$Global_active_power,lwd=1)
axis(2)
ticks = c(1,nrow(epcSub)/2,nrow(epcSub))
xlabels = c("Thu","Fri","Sat")
axis(1,at=ticks,labels=xlabels)
box(lty = "solid")
#write png 480x480
dev.copy(png,"plot2.png") #480x480 default device size
dev.off()