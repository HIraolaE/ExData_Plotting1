#Read all the data
data <- read.csv(file="data/household_power_consumption.txt", sep=";")
#get the data of the 2 selected days.
selData <- data[as.character(data$Date)=="1/2/2007"|as.character(data$Date)=="2/2/2007",]
#Get global active power
gap <- as.numeric(as.character(selData$Global_active_power))
#Read days and times and paste together.
days <- as.character(selData$Date)
times <- as.character(selData$Time)
dates <- paste(days,times)
#Convert dates int posix
datesPosix <- strptime(dates, "%d/%m/%Y %H:%M:%S")
#Open png graphic device
png("figurepng/plot2.png", width = 480, height =480,bg = "transparent")
#plot the graphic
plot(datesPosix,gap, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Close the graphic device
dev.off()