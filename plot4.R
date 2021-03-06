## Read the data
elecdata <- read.table("./data/household_power_consumption.txt", sep=";", header=T, na.strings="?")
data <- elecdata[elecdata$Date=="01/02/2007"| elecdata$Date=="02/02/2007",]
elecdata$Date <- as.Date(elecdata$Date, "%d/%m/%Y")  ## Convert the format of Date Column
data$Timestamp <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S", tz="UTC") ## Create timestamp

## Create the histogram
png("plot4.png", width=480, height=480)  ## launch png device
par(mfrow=c(2,2))
with(data, plot(Timestamp, Global_active_power, type = "l", xlab="", ylab="Global Active Power"))
        
with(data, plot(Timestamp, Voltage, type = "l", xlab="datetime", ylab="Voltage"))

with(data, {        
        plot(Timestamp, Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering")
        lines(Timestamp, Sub_metering_2, type= "l", col= "red")
        lines(Timestamp, Sub_metering_3, type= "l", col= "blue")
        legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
})
        
with(data, plot(Timestamp, Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power"))


dev.off()  ## close the device