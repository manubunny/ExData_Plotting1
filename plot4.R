#Set current working directory
setwd("C:/Users/Mandeep/Documents/Rcourse")

#load  packages
library(data.table)
library(lubridate)

#open windows device
windows(width=10,height=8)

#read data in "data1"
data1<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

#extract data for time frame "Feb1,2007 - Feb2,2007"
data2<-data1[((data1$Date=="2/1/2007")|(data1$Date=="2/2/2007")),]

#concatinate Date and time
concat=paste(data2$Date,data2$Time)


#used strptime to convert into date time format
totime<-as.POSIXct(strptime(concat,"%m/%d/%Y %H:%M:%S"))

#par function to combine four plots in one graph
par(mfrow=c(2,2))

#plot first graph
plot(totime,(as.numeric(data2$Global_active_power)/1000),type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",ylim = c(0,6),yaxp=c(0,6,3))

#plot second graph
plot(totime,as.character(data2$Voltage),type = "l", xlab = "datetime", ylab = "Voltage",ylim = c(234,246),yaxp=c(234,246,6))

#plot third graph
plot(totime, data2$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering",col="black",ylim = c(0,30),yaxp=c(0,30,3))

#annotate in third graph
points(totime, as.numeric(as.character(data2$Sub_metering_2)), type = "l", xlab = "", ylab = "Energy sub metering", 
col = "red",ylim = c(0,30),yaxp=c(0,30,3))

points(totime, data2$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
col = "blue")

#annotate legend in third graph
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                             "Sub_metering_2", "Sub_metering_3"))     

#plot fourth graph
plot(totime,(as.numeric(data2$Global_reactive_power)/1000),type = "l", xlab = "datetime", ylab = "Global_reactive_power",ylim = c(0.0,0.5),yaxp=c(0.0,0.5,5))

#open a PNG graphic device to copy plot from screen device to PNG.
dev.copy(png,file="plot4.png",width=480,height=480,res=50)

#close graphic device
dev.off()