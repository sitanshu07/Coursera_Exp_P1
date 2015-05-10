

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./household_power_consumption.zip")

# please unzip the the above downloaded file into your working directory

# import
data = read.table("household_power_consumption.txt",  stringsAsFactors=F, sep = ";", header = TRUE)


# subset by date
data_main = data[data[,1] == "1/2/2007" | data[,1] == "2/2/2007" ,]

#convert to date
data_main$Date <- as.Date(data_main$Date, format="%d/%m/%Y")

# make new concat variable
data_main$time = paste(as.Date(data_main$Date),data_main$Time)

# convert to POSIXct
data_main$time = as.POSIXct(data_main$time)


# plot to get the graph

plot(data_main$time,data_main$Sub_metering_1,type = "l",xlab = "",ylab = "Energy Sub metering")
lines(data_main$time,data_main$Sub_metering_2, type = "l", col = "red")
lines(data_main$time,data_main$Sub_metering_3, type = "l",col = "blue")

# give legend
legend("topright",col = c("black", "red","blue"), lwd = c(2,2,2),lty=c(1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
