#Set current working directory
setwd("C:/Users/Mandeep/Documents/Rcourse")

#load "data.table" package
library(data.table)

#read data in "data1" 
data1<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

#extract data for time frame "Feb1,2007 - Feb2,2007"
data2<-data1[((data1$Date=="1/2/2007")|(data1$Date=="2/2/2007")),]

#Use Hist function to plot the graph
hist((as.numeric(data2$Global_active_power)/1000),breaks=13,col="red",main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)",xlim=c(0,6),xaxp=c(0,6,3))

#open a PNG graphic device to copy plot from screen device to PNG.
dev.copy(png,file="plot1.png",height=480,width=480,units='px')

#close graphic device
dev.off()