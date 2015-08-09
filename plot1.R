################# Uncomment if the file is not in the current directory #####################################

#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="./household_power_consumption.zip")
#unzip(zipfile="./household_power_consumption.zip")

#######################################################################################################



data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
data$Date <- strptime(data$Date, format= "%d/%m/%Y")
format(data$Date, format="%Y-%m-%d")
data <- subset(data, data$Date %in% as.POSIXlt(c('2007-02-01', '2007-02-02')))
data$Datetime <- strptime(paste(data$Date, data$Time), "%d-%m-%Y %H:%M:%S")
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red",ylim = c(0, 1200), xlim = c(0, 6))


#copy to png file
dev.copy(png, file="plot1.png" )
dev.off()