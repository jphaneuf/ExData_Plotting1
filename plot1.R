#Set working directory to script's directory
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)
#read data,subset by date, and convert numeric from character
if(!exists("epcData")) epcData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
epcSub <- epcData[epcData$Date=="1/2/2007"|epcData$Date=="2/2/2007",]
epcSub$Global_active_power <- as.numeric(gsub(" ","",epcSub$Global_active_power))
#make plot
hist(epcSub$Global_active_power,main="Global Active Power (kW)",ylab="Frequency",xlab="Global Active Power (kiloWatts)",col="red",axes=FALSE)
axis(2)
axis(1,c(0,2,4,6))
box(lty = "solid")
#write png 480x480
dev.copy(png,"plot1.png") #480x480 default device size
dev.off()