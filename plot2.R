
#Set current working directory
setwd("C:/Users/Mandeep/Documents/Rcourse")

#load  packages
library(data.table)
library(lubridate)

#read data in "data1" 
data1<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

#extract data for time frame "Feb1,2007 - Feb2,2007"
data2<-data1[((data1$Date=="2/1/2007")|(data1$Date=="2/2/2007")),]

#concatinate Date and time
concat=paste(data2$Date,data2$Time)

#used strptime to convert into date time format
totime<-as.POSIXct(strptime(concat,"%m/%d/%Y %H:%M:%S"))

#used to plot function for drwaing graph
plot(totime,(as.numeric(data2$Global_active_power)/1000),type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",ylim = c(0,6),yaxp=c(0,6,3))

#open a PNG graphic device to copy plot from screen device to PNG.
dev.copy(png,file="plot2.png",height=480,width=480,units='px')

#close graphic device
dev.off()