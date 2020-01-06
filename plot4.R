
#data <- read.table("C:\\Users\\rnoireau\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", stringsAsFactors=FALSE)

#data <- subset(data, as.Date(data$Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y") | as.Date(data$Date,"%d/%m/%Y") == as.Date("02/02/2007","%d/%m/%Y"))

#share the windows
par(mfrow=c(2,2))

#plot 1
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(data$Global_active_power)*0.002, type="l", xlab="datetime", ylab="GLobal Active Power(kilowatts)")


#plot 2
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(data$Voltage)*0.1, type="l", xlab="datetime", ylab="Voltage")

#plot 3

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(data$Sub_metering_1), type="l", ylab="Energiy sub metering",ylim=c(0,40))

lines(datetime, as.numeric(data$Sub_metering_2), col="red", lwd=1, ylim=c(0,40))
lines(datetime, as.numeric(data$Sub_metering_3), col="blue", lwd=1, ylim=c(0,40))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red", "blue"))


#plot 4
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(data$Global_reactive_power)*0.1, type="l", xlab="datetime", ylab="Global_reactive_power")

#globol title
title("Plot 4")


#create png file
dev.print(device = png, file ="plot4.png",width = 480, height = 480 )
#dev.off()
