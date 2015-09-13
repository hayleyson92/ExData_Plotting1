## Read the data
elecdata <- read.table("./data/household_power_consumption.txt", sep=";", header=T, na.strings="?")
data <- elecdata[elecdata$Date=="01/02/2007"| elecdata$Date=="02/02/2007",]
elecdata$Date <- as.Date(elecdata$Date, "%d/%m/%Y")  ## Convert the format of Date Column
data$Timestamp <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S", tz="UTC") ## Create timestamp

## Create the plots
png("plot3.png", width=480, height=480)  ## launch png device
with(data, plot(Timestamp, Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering"))
with(data, lines(Timestamp, Sub_metering_2, type= "l", col= "red"))
with(data, lines(Timestamp, Sub_metering_3, type= "l", col= "blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()  ## close the device