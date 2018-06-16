library(data.table) #load the data.table package

data <- fread("household_power_consumption.txt", stringsAsFactors = F) #load the data

data_datesubset <- data[Date == "1/2/2007" | Date == "2/2/2007",] #get both dates

png("plot1.png", width = 480, height = 480)
hist(as.numeric(data_datesubset[,Global_active_power], na.rm = T), #make data numeric
     freq = 0.5, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")
dev.off()
