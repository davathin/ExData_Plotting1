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

#Open PNG device and create line chart with sub plots
png("plot3.png", width = 480, height = 480)
plot(epc_data$Time,epc_data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(epc_data$Time,epc_data$Sub_metering_2,col="red")
lines(epc_data$Time,epc_data$Sub_metering_3,col="blue")
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'),lty='solid')
dev.off()
