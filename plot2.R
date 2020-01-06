#read data
data <- read.table("C:\\Users\\rnoireau\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", stringsAsFactors=FALSE)

#extract some data
data <- subset(data, as.Date(data$Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y") | as.Date(data$Date,"%d/%m/%Y") == as.Date("02/02/2007","%d/%m/%Y"))

#one plot one the windows
par(mfrow=c(1,1))

#creat the plot
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(data$Global_active_power)*0.002, type="l", ylab="GLobal Active Power(kilowatts)", main="Plot 2")

#create png file
dev.print(device = png, file ="plot2.png",width = 480, height = 480 )
