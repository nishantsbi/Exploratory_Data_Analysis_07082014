consumption <- read.csv("H:/statistics elearning/courseera videos/Exploratory Data Analysis/EDA R codes/household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,stringsAsFactors = FALSE)

# Convert date and time to date/time formats

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")


#Filter the file to the relevant date range (2007-02-01 to 2007-02-02)
consumption.sub <- consumption[consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02", ]

# Create the histogram
par(mar = c(5, 5, 4, 2)) # setting the margins
with(consumption.sub, hist(Global_active_power, # create histogram on screen device of var"Global_active_power"
                  col = "red",  # make bars red
                  main = "Global Active Power", # add title
                  cex.axis = 0.80, # set axis font size according to spec
                  cex.lab = 0.80, # set axis label size according to spec
                  xlab = "Global active power (kilowatts)")) # add x-axis label

# Save PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480) # Copy plot to a PNG file
dev.off() # Close PNG device