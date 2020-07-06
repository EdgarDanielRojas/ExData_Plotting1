# NOTE: If for any reason lines of code are commented it is due to the fact that it takes
# a lot of time to take those steps so they were disabled for speed
# Run once to download the data for the project
url_data = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url_data,'assignment.zip')
unzip('assignment.zip')
# Read data into data tables
electric_consumption <- read.table('household_power_consumption.txt',na.strings="?",sep=';',header = T)
# Process only needed data and convert columns into datatypes needed
electric_consumption <- subset(electric_consumption, electric_consumption$Date %in% c('1/2/2007','2/2/2007'))
electric_consumption$Date <- as.Date(electric_consumption$Date,format = '%d/%m/%Y')
combined <- paste(electric_consumption$Date,electric_consumption$Time)
electric_consumption$DT <- as.POSIXct(combined)
# Open a png device and save plot there
png('plot2.png')
plot(electric_consumption$DT,electric_consumption$Global_active_power,type="l",xlab='',ylab = 'Global Active Power (kilowatts)')
dev.off()