download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","ExploratoryPA1.zip")
data <- read.table(unzip("ExploratoryPA1.zip"),header=TRUE,sep=";",na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
newdata <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
newdata$DateTime <- as.POSIXct(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(newdata$DateTime,newdata$Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
