## Reading full dataset
house_full <- read.csv("./Data/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows=2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
house_full$Date <- as.Date(house_full$Date, format="%d/%m/%Y")

## Subsetting data for two days
data <- subset(house_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(house_full)

## Converting date&time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saving to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()