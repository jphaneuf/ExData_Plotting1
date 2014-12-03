#Set working directory to script's directory
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)
#read data
if(!exists("epcData")) epcData <- read.table("household_power_consumption.txt")
#make plot
#barplot
#ylabel frequency
#xlabel Global Active Power(kiloWatts)
#write png 480x480