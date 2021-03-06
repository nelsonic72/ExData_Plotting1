## Exporatory Data Analysis - Project 1 - Plot 2

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.zip"

if(!file.exists(file)) {
      download.file(url, file, mode="wb")
}

unzip(file)

#Load the data
HPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
HPC$DateTime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
HPC$Date <- as.Date(HPC$Date, "%d/%m/%Y")
HPC$Time <- strptime(HPC$Time, format="%H:%M:%S")
#subset here for efficiency
HPC <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02")
#clean data
HPC$Global_active_power <- as.numeric(HPC$Global_active_power)
HPC$Global_reactive_power <- as.numeric(HPC$Global_reactive_power)
HPC$Voltage <- as.numeric(HPC$Voltage)
HPC$Global_intensity <- as.numeric(HPC$Global_intensity)
HPC$Sub_metering_1 <- as.numeric(HPC$Sub_metering_1)
HPC$Sub_metering_2 <- as.numeric(HPC$Sub_metering_2)
HPC$Sub_metering_3 <- as.numeric(HPC$Sub_metering_3)

#Plot 2 - Line Graph of Global Active Power by Date-Time
png("plot2.png", width=480, height=480)
plot(HPC$DateTime, HPC$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()

