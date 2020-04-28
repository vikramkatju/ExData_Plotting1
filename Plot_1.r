rm (list = ls())
dat <- read.table('household_power_consumption.txt', header = TRUE, sep = ";",
                  na.strings = "?", stringsAsFactors = FALSE)
str(dat)

dat <- subset(dat, Date == '1/2/2007' | Date == '2/2/2007')
str(dat)

png(filename = "Plot_1.png", height = 480, width = 480, units = "px", bg = "transparent"
    )
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power", col = "Red")
dev.off()