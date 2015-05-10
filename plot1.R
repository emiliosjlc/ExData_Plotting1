# Coursera: 04 Exploratory Data Analysis
# Project 1-1
# Plot 1

# read data

library(dplyr)


data <- read.table("data/household_power_consumption.txt", sep = ";", header = T,
                   na.strings = "?")
data_tb <- tbl_df(data)

# select target dates
data_tb <- filter(data_tb, Date == "1/2/2007" | Date == "2/2/2007")
# Clean NAs
good <- complete.cases(data_tb)
data_tb <- data_tb[good, ]

# make plot
png("plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist(data_tb$Global_active_power, freq = TRUE, col ="red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

dev.off()
