## load data and convert the "?" as NA
power_data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
## filter data from the dates 2007-02-01 and 2007-02-02
power_data <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))
## generate a new variable containing both date and time named as D_T
power_data$D_T <- paste(power_data_sub$Date, power_data_sub$Time)
## convert D_T to a POSIXlt variable
power_data$D_T <- strptime(power_data$D_T, "%d/%m/%Y %H:%M:%S")
## set the plotting layout
par(mfrow = c(2,2), mar = c(4,4,0.5,1))
## plot the first graph
with(power_data, plot(x = D_T, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
with(power_data, plot(D_T, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(power_data, plot(x = D_T, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l"))
lines(power_data$D_T, y = Sub_metering_2, col = "red")
lines(power_data$D_T, y = Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex=0.8, bty = "n")
with(power_data, plot(x = D_T, Global_reactive_power, type = "l", xlab = "datetime"))
## export the plot as png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
