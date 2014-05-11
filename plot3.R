a <-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

b<- subset(a,a$Date == "1/2/2007"|a$Date == "2/2/2007")

b$datetime <-strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width=480,height=480)

with(b,plot(b$datetime,as.numeric(as.character(b$Sub_metering_1)),xlab = ""
            ,ylab = "Energy sub-metering",type = "l"))
legend("topright", col = c("black","red","blue"),lty = 1,cex =.75,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(b$datetime,as.numeric(as.character(b$Sub_metering_2)),xlab = ""
      ,ylab = "Energy sub-metering",type = "l",col = "red")
lines(b$datetime,as.numeric(as.character(b$Sub_metering_3)),xlab = ""
      ,ylab = "Energy sub-metering",type = "l",col = "blue")

dev.off()