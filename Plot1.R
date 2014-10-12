
#
# Plot1
#
#

# File household_power_consumption.txt is in working directory 
df <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = F)

# Create DateTime variable from Date and Time
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

# Select  2007-02-01 and 2007-02-02 days only
dfr <- df[(df$DateTime >= as.POSIXct("2007-02-01")) & (df$DateTime <=  as.POSIXct("2007-02-03")), ]

# Convert from character
dfr$Global_active_power <- as.numeric(dfr$Global_active_power)

# Plot1
hist(dfr$Global_active_power, col='red', xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# Copy to *.png, default is 480 X 480 pixels
dev.copy(png, "Plot1.png")
dev.off()

