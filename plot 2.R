
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
plot(data_main$time, data_main$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")

# copy to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

