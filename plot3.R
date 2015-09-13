################################################################################
## plot3.R
## 
## Benjamín J. Sánchez. Last Update: 2015-09-13
################################################################################

#Read and preprocess data:
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
data$Time <- strptime(paste(data$Date,data$Time), format = '%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#Construct plot:
png(filename = 'plot3.png', width = 480, height = 480)
par(mfrow = c(1,1))
with(data,plot(Time,Sub_metering_1,type = 'n', xlab = '',
               ylab = 'Energy sub metering'))
with(data, points(Time,Sub_metering_1, type = 'l', col = 'black'))
with(data, points(Time,Sub_metering_2, type = 'l', col = 'red'))
with(data, points(Time,Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', col = c('black','red','blue'), lty = 1,
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()

################################################################################