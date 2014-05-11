a <-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

b<- subset(a,a$Date == "1/2/2007"|a$Date == "2/2/2007")

b$datetime <-strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot2.png",width=480,height=480,bg = "transparent")

with(b,plot(b$datetime,as.numeric(as.character(b$Global_active_power)),xlab = ""
            ,ylab = "Global Active Power (kilowatts)",type = "l"))

dev.off()
