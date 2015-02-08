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

par(mar = c(3,5,3,3))
plot(real_data$real_time, real_data$real_gpower, type = "l", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
