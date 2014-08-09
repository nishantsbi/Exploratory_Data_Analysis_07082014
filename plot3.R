consumption <- read.csv("H:/statistics elearning/courseera videos/Exploratory Data Analysis/EDA R codes/household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,stringsAsFactors = FALSE)

# concatenate into a single var'DateTime'

DateTime <- strptime(paste(consumption$Date, consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
consumption.sub <- cbind(consumption, DateTime)

#Convert date and time to date/time formats
consumption.sub$Date <- as.Date(consumption.sub$Date, format = "%d/%m/%Y")

#Filter the file to the relevant date range (2007-02-01 to 2007-02-02)
consumption.sub <- consumption.sub[consumption.sub$Date >= "2007-02-01" & consumption.sub$Date <= "2007-02-02", ]

#create the plot
par(mar = c(5, 4, 4, 1))
with(consumption.sub, plot(DateTime, Sub_metering_1, main="", type = "l", xlab="",
                   ylab="Energy sub metering"))
with(consumption.sub, points(DateTime, Sub_metering_2, col="red", type="l"))#adding sub_metering_2 points connected by line to plot
with(consumption.sub, points(DateTime, Sub_metering_3, col="blue", type="l"))#adding sub_metering_3 points connected by line to plot
legend("topright", col = c("black", "red", "blue"), lwd = 1, cex = 0.7,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#creating PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480) # Copy plot to a PNG file
dev.off() # Close PNG device