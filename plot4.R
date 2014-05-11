a <-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

b<- subset(a,a$Date == "1/2/2007"|a$Date == "2/2/2007")

b$datetime <-strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot4.png",width=480,height=480, bg = "transparent")

par(mfrow=c(2,2))

with(b,plot(b$datetime,as.numeric(as.character(b$Global_active_power)),xlab = ""
            ,ylab = "Global Active Power",type = "l"))

with(b,plot(b$datetime,as.numeric(as.character(b$Voltage)),xlab = "datetime"
            ,ylab = "Voltage",type = "l"))

with(b,plot(b$datetime,as.numeric(as.character(b$Sub_metering_1)),xlab = ""
            ,ylab = "Energy sub-metering",type = "l"))
legend("topright", col = c("black","red","blue"),lty = 1,cex = .75,box.lwd = 0,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(b$datetime,as.numeric(as.character(b$Sub_metering_2)),xlab = ""
      ,ylab = "Energy sub-metering",type = "l",col = "red")
lines(b$datetime,as.numeric(as.character(b$Sub_metering_3)),xlab = ""
      ,ylab = "Energy sub-metering",type = "l",col = "blue")


with(b,plot(b$datetime,as.numeric(as.character(b$Global_reactive_power)),xlab = "datetime"
            ,ylab = "Global_reactive_power",type = "l"))

dev.off()
     
