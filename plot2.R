consumption <- read.csv("H:/statistics elearning/courseera videos/Exploratory Data Analysis/EDA R codes/household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,stringsAsFactors = FALSE)

# concatenate into a single var'DateTime'

DateTime <- strptime(paste(consumption$Date, consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
consumption.sub <- cbind(consumption, DateTime)

#Convert date and time to date/time formats
consumption.sub$Date <- as.Date(consumption.sub$Date, format = "%d/%m/%Y")

#Filter the file to the relevant date range (2007-02-01 to 2007-02-02)
consumption.sub <- consumption.sub[consumption.sub$Date >= "2007-02-01" & consumption.sub$Date <= "2007-02-02", ]

#Create a plot
par(mar = c(5, 5, 4, 2)) # setting the margins
plot(consumption.sub$DateTime,consumption.sub$Global_active_power, # create a plot
     type = "l", # type should be line plot
     cex.axis = 0.70, # set axis font size according to spec
     cex.lab = 0.70, # set axis label font size according to spec
     xlab = "", # making the x-axis blank
     ylab = "Global Active Power (kilowatts)") # y-axis label

#creating PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480) # Copy plot to a PNG file
dev.off() # Close PNG device