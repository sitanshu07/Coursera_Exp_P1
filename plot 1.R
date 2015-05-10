
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./household_power_consumption.zip")

# please unzip the the above downloaded file into your working directory

# read and subset data by date
data = read.table("household_power_consumption.txt",  stringsAsFactors=F, sep = ";", header = TRUE)
data_main = data[data[,1] == "1/2/2007" | data[,1] == "2/2/2007" ,]

# plot histogram
hist(data_main$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power(kilowatts)")


# copy to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()