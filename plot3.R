# Download Electric power consumption data from the link provided by the 
# instructor
# unzip the file and save household_power_consumption.txt under folder data

# loading the data from the local drive

data <- read.csv2("./data/household_power_consumption.txt", as.is=T, 
                  na.strings = "?")

# subsetting the data from the dates 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date,"%d/%m/%Y")

data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

time <- with(data,strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"))

for(i in 3:9) data[,i] <- as.numeric(data[,i])

# plot Energy sub metering ~ Time

png("plot3.png", width = 480, height = 480)
                          
plot(time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")                           
lines(time, data$Sub_metering_2, col="red")  
lines(time, data$Sub_metering_3, col="blue")  
legend("topright",lwd=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
             

# save the plot in plot3.png

dev.off()
