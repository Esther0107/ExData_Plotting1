## This R script constructs the plot1.png

## load data and convert the "?" as NA
power_data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

## filter data from the dates 2007-02-01 and 2007-02-02
power_data <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))

## plot the histgram for global active power
hist(power_data$Global_active_power, col = "red",main = "Global Active Power", xlab = "Global active power (kilowatts)")

## export the plot as png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
