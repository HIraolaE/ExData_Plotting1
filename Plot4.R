#Read all the data
data <- read.csv(file="data/household_power_consumption.txt", sep=";")
#get the data of the 2 selected days.
selData <- data[as.character(data$Date)=="1/2/2007"|as.character(data$Date)=="2/2/2007",]
#Get global active power
gap <- as.numeric(as.character(selData$Global_active_power))
#Get global reactive power
grp <- as.numeric(as.character(selData$Global_reactive_power))
#Get Sum metering readings
sm1 <- as.numeric(as.character(selData$Sub_metering_1))
sm2 <- as.numeric(as.character(selData$Sub_metering_2))
sm3 <- as.numeric(as.character(selData$Sub_metering_3))
#Get Voltage
voltage <- as.numeric(as.character(selData$Voltage))
#Read days and times and paste together.
days <- as.character(selData$Date)
times <- as.character(selData$Time)
dates <- paste(days,times)
#Convert dates int posix
datesPosix <- strptime(dates, "%d/%m/%Y %H:%M:%S")
#Open png graphic device
png("figurepng/plot4.png", width = 480, height =480,bg = "transparent")
#Divide the plot into 2x2 matrix
par(mfrow= c(2,2))
#add plots
plot(datesPosix,gap, type="l", ylab="Global Active Power", xlab="")
plot(datesPosix,voltage, type="l", ylab="Voltage", xlab="datetime")
plot(datesPosix,sm1, type="l", ylab="Energy sum metering", xlab="", )
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), col=c("black","red","blue"), lty=1, cex=0.85, bty="n")
lines(datesPosix,sm2, col="red")
lines(datesPosix,sm3,  col="blue")
plot(datesPosix,grp, type="l", ylab="global_reactive_power", xlab="datetime")
##close the graphic devie
dev.off()
