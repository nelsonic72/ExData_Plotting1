## Exporatory Data Analysis - Project 1 - Plot 3

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

#Plot 3 - Line Graph of 3 series - Sub Meeting 1-3
png("plot3.png", width=480, height=480)
plot(HPC$DateTime, HPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub meeting")
lines(HPC$DateTime, HPC$Sub_metering_2, type="l", col="red")
lines(HPC$DateTime, HPC$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
##dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off()

