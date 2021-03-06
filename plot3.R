# Plotting code for Courser Data Science - Exploratory Data Analysis
# Course Project Assignment 1
# Isha Lamboo

# Fix regional settings to display weekdays in English (instead of Dutch)
Sys.setlocale("LC_TIME", "English")

library(dplyr)

# Get data and load it into a tibble
mydata <- tbl_df(read.table('household_power_consumption.txt',sep=';',na.strings = '?',header = TRUE, as.is = TRUE))

# Convert dates, Filter rows by date and replace Date and Time with "RealDate" datetime column
# this is the data source for all plots
plotdata <- mydata %>% mutate(RealDate = as.POSIXct(strptime(paste(Date, Time),format = '%d/%m/%Y %H:%M:%S'))) %>% filter(RealDate >= '2007-02-01' & RealDate < '2007-02-03') %>% select(RealDate, Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)

# plot 3
with(plotdata, plot(RealDate,Sub_metering_1,type = 'l',main = '',xlab ='',ylab = 'Energy sub metering'))
with(plotdata, lines(x = RealDate, y = Sub_metering_2, col = 'red'))
with(plotdata, lines(x = RealDate, y = Sub_metering_3, col = 'blue'))
legend('topright', lty = 1, col = c('black','red','blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,'plot3.png', width = 480, height = 480, units = "px")
dev.off()