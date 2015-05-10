library(dplyr)
library(lubridate)

data <- read.table("data/household_power_consumption.txt", sep = ";", header = T,
                   na.strings = "?")
data_tb <- tbl_df(data)

# select target dates
data_tb <- filter(data_tb, Date == "1/2/2007" | Date == "2/2/2007")
# Clean NAs
good <- complete.cases(data_tb)
data_tb <- data_tb[good, ]
data_d <- mutate(data_tb, 
                 date_time = paste(data_tb$Date, data_tb$Time))
date <- dmy_hms(data_d$date_time)

# make plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

with(data_tb, plot(date, Global_active_power, type = "l", 
                   ylab = "Global Active Power", 
                   xlab = "")
)

with(data_tb, plot(date, Voltage, type = "l", 
                   ylab = "Voltage", 
                   xlab = "datetime")
)

plot(date, data_tb$Sub_metering_1, type ="n", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(date, data_tb$Sub_metering_1, col ="black")
lines(date, data_tb$Sub_metering_2, col ="red")
lines(date, data_tb$Sub_metering_3, col ="blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1),
       bty ="n",
)

with(data_tb, plot(date, Global_reactive_power, type = "l", 
                   ylab = "Global_reactive_power", 
                   xlab = "datetime")
)

dev.off()
