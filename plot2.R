getwd()
setwd("/home/Desktop/cousera/Exploratory Data Analysis/")
#create file directory
if(!file.exists("./data")){dir.create("./data")}
# download dataset and put in working directory
# read text file
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec ="." )
subsetData  <-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# str(subsetData)
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot2.png",width = 480, height = 480)
#  plot the graph
#hist(globalActivePower,col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
