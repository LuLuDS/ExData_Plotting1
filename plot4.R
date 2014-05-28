# Download Electric power consumption data from the link provided by the 
# instructor
# unzip the file and save household_power_consumption.txt under folder data

# loading the data from the local drive

data <- read.csv2("./data/household_power_consumption.txt", as.is=T, 
                  na.strings = "?")

# subsetting the data from the dates 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date,"%d/%m/%Y")

data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

data$datetime <- with(data,strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"))

for(i in 3:9) data[,i] <- as.numeric(data[,i])

png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

# plot Global Active Power ~ time
with(data, plot(datetime, Global_active_power, type="l", 
                xlab="", ylab="Global Active Power"))

# plot Energy sub metering ~ time
with(data, plot(datetime, Sub_metering_1, type="l", xlab="", 
                ylab="Energy sub metering"))                           
with(data, lines(datetime, Sub_metering_2, col="red"))  
with(data, lines(datetime, Sub_metering_3, col="blue"))  
legend("topright",lwd=1, bty="n", col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot Voltage ~ time
with(data, plot(datetime, Voltage, type="l"))

# plot Global_reactive_power ~ time
with(data, plot(datetime, Global_reactive_power, type="l"))


# save the plot in plot4.png

dev.off()
