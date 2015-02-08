elec_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(elec_data)
View(elec_data)
class(elec_data)
class(elec_data$Date)

real_data <- subset(elec_data, Date == "1/2/2007" | Date == "2/2/2007")
View(real_data)

real_data$real_time <- strptime(paste(real_data$Date, real_data$Time), "%d/%m/%Y %H:%M:%S")
real_data$real_gpower <- as.numeric(as.character(real_data$Global_active_power))
View(real_data)

png(file = "plot4.png")

par(mfrow = c(2,2))
with(real_data, {
     plot(real_time, real_gpower, type = "l", ylab = "Global Active Power", xlab ="")
     plot(real_time, as.numeric(as.character(Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
     with(real_data, plot(real_time, as.numeric(as.character(Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = ""))
     with(real_data, points(real_time, as.numeric(as.character(Sub_metering_2)), col = "red", type = "l"))
     with(real_data, points(real_time, Sub_metering_3, col = "blue", type = "l"))
     legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, cex = 0.9, bty = "n")
     plot(real_time, as.numeric(as.character(Global_reactive_power)),type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()