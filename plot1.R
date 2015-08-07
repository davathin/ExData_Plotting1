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

  #Open PNG device and create histogram
  png("plot1.png", width = 480, height = 480)
  hist(epc_data$Global_active_power, main="Global Acitve Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
