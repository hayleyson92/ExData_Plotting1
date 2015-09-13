## Read the data
elecdata <- read.table("./data/household_power_consumption.txt", sep=";", header=T, na.strings="?")
data <- elecdata[elecdata$Date=="01/02/2007"| elecdata$Date=="02/02/2007",]  ## Subset the data
elecdata$Date <- as.Date(elecdata$Date, "%d/%m/%Y")  ## Convert the format of Date Column


## Create the histogram
png("plot1.png", width=480, height=480)  ## launch png device
with(data, hist(Global_active_power, main="Global Active Power", xlab= "Global Active Power (kilowatts)", col= "red"))
dev.off()  ## close the device









