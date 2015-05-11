library(ggplot2)
#reading data
dane <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#changing "Date" class
dane$Date <- as.Date(dane$Date, format="%d/%m/%Y")

#subseting selected dates
data <- subset(dane, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dane)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot 4
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

#top left
plot(data$Global_active_power~data$Datetime,type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

#top right
plot(data$Voltage~data$Datetime,type="l", 
     ylab="Voltage", xlab="datatime")
#bottom left
plot(data$Sub_metering_1~data$Datetime, ylab="Energy sub metering", xlab="", type="l")
lines(data$Sub_metering_2~data$Datetime, col ="red")
lines(data$Sub_metering_3~data$Datetime, col ="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2,bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottom right
plot(data$Global_reactive_power~data$Datetime, type="l", 
     ylab="Global_rective_power",xlab="datatime")

#saving as png
dev.copy(png,"Plot4.png", width=480, height=480)
dev.off()