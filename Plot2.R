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

#Plot 2


plot(data$Global_active_power~data$Datetime,type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

#saving as png
dev.copy(png,"Plot2.png", width=480, height=480)
dev.off()