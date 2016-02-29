#Plot1

#Read in TXT file
data = read.table("household_power_consumption.txt", sep=";",na.strings="?", header=TRUE)

#Subset data for two days: 2007-02-01 and 2007-02-02
data = data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Convert the Date and Time variables to Date/Time classes
data$Time = strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
data$Date = as.Date(data$Date,"%d/%m/%Y")

#Convert variables to numeric
data$Global_active_power = as.numeric(data$Global_active_power)
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)
data$Voltage = as.numeric(data$Voltage)
data$Global_reactive_power = as.numeric(data$Global_reactive_power)

#Set PNG graphic
png('plot1.png',width=480,height=480)

#Create histogram: Global active power
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Turn off PNG graphic
dev.off()