#read the data
data <- read.table("C:\\Users\\rnoireau\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", stringsAsFactors=FALSE)

#extract some data
data <- subset(data, as.Date(data$Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y") | as.Date(data$Date,"%d/%m/%Y") == as.Date("/02/02/2007","%d/%m/%Y"))

#one plot on the windows
par(mfrow=c(1,1))

#create graph
hist(as.numeric(data$Global_active_power), breaks = 14, col = "red", main = "Global_active_power", xlab = "Global Active Power (kilowatts)")

#create png file
dev.print(device = png, file ="plot1.png",width = 480, height = 480 )
