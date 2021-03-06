

#
# Plot3
#
#

# File household_power_consumption.txt is in working directory 
df <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = F)

# Create DateTime variable from Date and Time
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

# Select  2007-02-01 and 2007-02-02 days only
dfr <- df[(df$DateTime >= as.POSIXct("2007-02-01")) & (df$DateTime <=  as.POSIXct("2007-02-03")), ]

# Convert characters to numeric
dfr$Sub_metering_1 <- as.numeric(dfr$Sub_metering_1)
dfr$Sub_metering_2 <- as.numeric(dfr$Sub_metering_2)
dfr$Sub_metering_3 <- as.numeric(dfr$Sub_metering_3)

plot(dfr$DateTime, dfr$Sub_metering_1, col = 'black', type = 'l', xlab = "", ylab = "Energy sub metering")
lines(dfr$DateTime, dfr$Sub_metering_2, col = 'red', type = 'l')
lines(dfr$DateTime, dfr$Sub_metering_3, col = 'blue', type = 'l')
legend("topright", lty = 1, col = c('black', 'red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7)

# Copy to *.png, default is 480 X 480 pixels
dev.copy(png, "Plot3.png")
dev.off()
