#Read in table
epc_data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?',colClasses=c(rep('character', 2),rep('numeric', 7)))
#Convert Date column from character to Date
epc_data$Date<-as.Date(epc_data$Date,"%d/%m/%Y")
#Combine Date and Time for simplification
epc_data$Time<-paste(epc_data$Date,epc_data$Time,sep=" ")
#Reformat
epc_data$Time<-strptime(epc_data$Time, "%Y-%m-%d %H:%M:%S")

#Subset data from 2007-02-01 and 2007-02-02
epc_data<-subset(epc_data,Date=="2007-02-01"|Date=="2007-02-02")

#Open PNG device, create 2x2 plot area each of the 4 assocaited graphs
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
#plot1
plot(epc_data$Time,epc_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#plot2
plot(epc_data$Time,epc_data$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot3
plot(epc_data$Time,epc_data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(epc_data$Time,epc_data$Sub_metering_2,col="red")
lines(epc_data$Time,epc_data$Sub_metering_3,col="blue")
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'),lty='solid',bty="n")
#plot4
plot(epc_data$Time,epc_data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
