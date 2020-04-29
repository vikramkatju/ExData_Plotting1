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

png(filename = "Plot_2.png", height = 480, width = 480, units = "px", bg = "transparent"
)

plot(dat.2$Global_active_power ~ dat.2$date2.time, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()