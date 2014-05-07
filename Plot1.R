#Read all the data
data <- read.csv(file="data/household_power_consumption.txt", sep=";")
#get the data of the 2 selected days.
selData <- data[as.character(data$Date)=="1/2/2007"|as.character(data$Date)=="2/2/2007",]
#Get global active power
gap <- as.numeric(as.character(selData$Global_active_power))
#Open png device
png("figurepng/plot1.png", width = 480, height =480,bg = "transparent")
#Write the histogram
hist(gap,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Close the graphic device
dev.off()
