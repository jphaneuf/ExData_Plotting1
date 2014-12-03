#Set working directory to script's directory
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)
#read data
if(!exists("epcData")) epcData <- read.table("household_power_consumption.txt")
#subset by date:2007-02-01 and 2007-02-02
epcSub <- epcData[epcData$Date=="2/1/2007"|epcData$Date=="2/2/2007",]
#convert to numeric.  Also note that spaces mess up the conversion, so need to be removed.
epcSub$Global_active_power <- as.numeric(gsub(" ","",epcSub$Global_active_power))

#make plot
hist(epcSub$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kiloWatts)",col="red",axes=FALSE)
axis(2)
axis(1,c(0,2,4,6))

#write png 480x480
dev.copy(png,"plot1.png") #480x480 default device size
dev.off()