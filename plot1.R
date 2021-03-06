################################################################################
## plot1.R
## 
## Benjam�n J. S�nchez. Last Update: 2015-09-13
################################################################################

#Read and preprocess data:
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
data$Time <- strptime(paste(data$Date,data$Time), format = '%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Construct plot:
png(filename = 'plot1.png', width = 480, height = 480)
par(mfrow = c(1,1))
hist(data$Global_active_power,col = 'red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
dev.off()

################################################################################