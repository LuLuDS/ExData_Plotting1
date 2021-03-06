# Download Electric power consumption data from the link provided by the 
# instructor
# unzip the file and save household_power_consumption.txt under folder data

# loading the data from the local drive

data <- read.csv2("./data/household_power_consumption.txt", as.is=T, 
                  na.strings = "?")

# subsetting the data from the dates 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date,"%d/%m/%Y")

data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]



for(i in 3:9) data[,i] <- as.numeric(data[,i])

# plot Global Active ~ Time

png("plot2.png", width = 480, height = 480)
with(data, plot(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"), 
                Global_active_power, type="l", xlab="",
                ylab="Global Active Power (Kilomatts)"))

# save the plot in plot2.png
dev.off()
