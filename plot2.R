##
## Downloading, unzipping, subsetting
##
if(!file.exists("household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
}

if(!file.exists("household_power_consumption.txt")) {
    unzip("household_power_consumption.zip")
}

d0 <- read.csv2("household_power_consumption.txt")
d1 <- d0[d0$Date == '1/2/2007' | d0$Date == '2/2/2007',]
rm(d0)


##
## Getting date & day of week
##
d1$Date_time <- strptime(paste(d1$Date, d1$Time, sep=" ") , '%e/%m/%Y %T')
Sys.setlocale("LC_TIME", "en_US.UTF-8")
d1$Day_of_week <- substring(weekdays(d1$Date_time),1,3)


## 
## Changing data frame string values to numeric
## 
d1$Global_active_power <- as.numeric(as.character(d1$Global_active_power))
d1$Global_reactive_power <- as.numeric(as.character(d1$Global_reactive_power))
d1$Voltage <- as.numeric(as.character(d1$Voltage))
d1$Sub_metering_1 <- as.numeric(as.character(d1$Sub_metering_1))
d1$Sub_metering_2 <- as.numeric(as.character(d1$Sub_metering_2))
d1$Sub_metering_3 <- as.numeric(as.character(d1$Sub_metering_3))


##
## Plot 2
##
png(file = "plot2.png", bg = "transparent", width = 480, height = 480)
par(mfrow=c(1,1))
par(mar=c(5, 6, 4, 4))
plot(d1$Date_time, d1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
