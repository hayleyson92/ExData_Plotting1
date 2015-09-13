## Read the data
elecdata <- read.table("./data/household_power_consumption.txt", sep=";", header=T, na.strings="?")
data <- elecdata[elecdata$Date=="01/02/2007"| elecdata$Date=="02/02/2007",]
elecdata$Date <- as.Date(elecdata$Date, "%d/%m/%Y")  ## Convert the format of Date Column
data$Timestamp <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S", tz="UTC") ## Create timestamp

## Create the plot
png("plot2.png", width=480, height=480)  ## launch png device
with(data, plot(Timestamp, Global_active_power, type = "l", xlab="", ylab="Global Active Power(kilowatts)"))
dev.off()  ## close the device
