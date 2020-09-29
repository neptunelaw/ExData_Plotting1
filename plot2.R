1. get data

data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

2. subset data

data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

3. date conversion
 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

4. generate plot

plot(data$Global_active_power~data$Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

5. Save file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
