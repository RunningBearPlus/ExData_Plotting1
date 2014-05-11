a <-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

b<- subset(a,a$Date == "1/2/2007"|a$Date == "2/2/2007")

png(file="plot1.png",width=480,height=480,bg = "transparent")

hist(as.numeric(as.character(b$Global_active_power))
     ,col = "red",main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",ylim = c(0,1200) )

dev.off()