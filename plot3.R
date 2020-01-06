#read data
data <- read.table("C:\\Users\\rnoireau\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", stringsAsFactors=FALSE)

#extract data
data <- subset(data, as.Date(data$Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y") | as.Date(data$Date,"%d/%m/%Y") == as.Date("02/02/2007","%d/%m/%Y"))

#one plot on the windows
par(mfrow=c(1,1))

#create plot
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(datetime, data$Sub_metering_1, type="l", ylab="Energiy sub metering", main="Plot 3", ylim=c(0,40))

lines(datetime, data$Sub_metering_2, col="red", lwd=1, ylim=c(0,40))

lines(datetime, data$Sub_metering_3, col="blue", lwd=1, ylim=c(0,40))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red", "blue"))

#create png file
dev.print(device = png, file ="plot3.png",width = 480, height = 480 )
