consumption <- read.csv("H:/statistics elearning/courseera videos/Exploratory Data Analysis/EDA R codes/household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,stringsAsFactors = FALSE)

# concatenate into a single var'DateTime'

DateTime <- strptime(paste(consumption$Date, consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
consumption.sub <- cbind(consumption, DateTime)

#Convert date and time to date/time formats
consumption.sub$Date <- as.Date(consumption.sub$Date, format = "%d/%m/%Y")

#Filter the file to the relevant date range (2007-02-01 to 2007-02-02)
consumption.sub <- consumption.sub[consumption.sub$Date >= "2007-02-01" & consumption.sub$Date <= "2007-02-02", ]

#Create a plot
par(mfrow=c(2,2)) # Plot will have figures in 2 rows x 2 columns  

#Create the first plot
plot(consumption.sub$DateTime,consumption.sub$Global_active_power, # create a plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "", # making the x-axis blank
     ylab = "Global Active Power (kilowatts)") # y-axis label

#Create the second plot
plot(consumption.sub$DateTime,consumption.sub$Voltage, # create a plot
type = "l", # type should be line plot
cex.axis = 0.70, # set axis font size according to spec
cex.lab = 0.70, # set axis label font size according to spec
xlab = "", # making the x-axis blank
ylab = "Voltage") # y-axis label

#Create third plot
with(consumption.sub, plot(DateTime, Sub_metering_1, main="", type = "l", xlab="",
                           ylab="Energy sub metering"))
with(consumption.sub, points(DateTime, Sub_metering_2, col="red", type="l"))#adding sub_metering_2 points connected by line to plot
with(consumption.sub, points(DateTime, Sub_metering_3, col="blue", type="l"))#adding sub_metering_3 points connected by line to plot
legend("topright", col = c("black", "red", "blue"), lwd = 1, cex = 0.7,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create the fourth plot
plot(consumption.sub$DateTime,consumption.sub$Global_reactive_power, # create a plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "", # making the x-axis blank
     ylab = "Global Reactive Power") # y-axis label

#creating PNG file
dev.copy(png, file = "plot4.png", width = 642, height = 495) # Copy plot to a PNG file.These dimensions were needed to ensure legend was visible.
dev.off() # Close PNG device