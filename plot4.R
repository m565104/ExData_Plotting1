#Plot4

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
png('plot4.png',width=480,height=480)

#Set charts in 2X2 space
par(mfrow=c(2,2))

#Create line chart: Global active power
plot(data$Time, data$Global_active_power, xlab="",ylab="Global Active Power", type='n')
lines(data$Time, data$Global_active_power)

#Create line chart: Voltage
plot(data$Time, data$Voltage, xlab="datetime",ylab="Voltage", type='n')
lines(data$Time, data$Voltage)

#Create multi-line chart: Sub metering
plot(data$Time, data$Sub_metering_1, xlab="",ylab="Energy sub metering", type='n')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"), bty="n")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

#Create line chart: Global reactive power
plot(data$Time, data$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power", type='n')
lines(data$Time, data$Global_reactive_power)

#Turn off PNG graphic
dev.off()