rm (list = ls())
dat <- read.table('household_power_consumption.txt', header = TRUE, sep = ";",
                  na.strings = "?", stringsAsFactors = FALSE)
str(dat)

dat.2 <- subset(dat, Date == '1/2/2007' | Date == '2/2/2007')
str(dat.2)

dat.2$Date <- as.Date(dat.2$Date, format = "%d/%m/%Y")

date.time <- paste(dat.2$Date, dat.2$Time)
str(date.time)

dat.2$date2.time <- as.POSIXct(date.time)
str(dat.2)

png(filename = "Plot_3.png", height = 480, width = 480, units = "px", bg = "transparent"
)
plot(dat.2$Sub_metering_1 ~ dat.2$date2.time, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat.2$Sub_metering_2 ~ dat.2$date2.time, type = "l", col = "red")
lines(dat.2$Sub_metering_3 ~ dat.2$date2.time, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2,cex = 0.7
)
dev.off()