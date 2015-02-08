elec_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(elec_data)
View(elec_data)
class(elec_data)
class(elec_data$Date)

real_data <- subset(elec_data, Date == "1/2/2007" | Date == "2/2/2007")
View(real_data)
real_data$Date
length(real_data$Date)
levels(real_data$Date)
as.numeric(as.character(real_data$Global_active_power))
real_data$Global_active_power

par(mar = c(5,5,5,5))
hist(as.numeric(as.character(real_data$Global_active_power)), col = "red", xlab = "Gloabl Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()
