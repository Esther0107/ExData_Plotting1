## This R script constructs the plot2.png

## load data and convert the "?" as NA
power_data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

## filter data from the dates 2007-02-01 and 2007-02-02
power_data <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))
power_data$D_T <- paste(power_data_sub$Date, power_data_sub$Time)
## convert date to a POSIXlt variable
power_data$D_T <- strptime(power_data$D_T, "%d/%m/%Y %H:%M:%S")

## plot the line graph for global active power on time dimension
with(power_data, plot(x = D_T, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## export the plot as png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
