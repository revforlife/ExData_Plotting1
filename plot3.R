library(data.table) #load the data.table package

data <- fread("household_power_consumption.txt", stringsAsFactors = F) #load the data

data_datesubset <- data[Date == "1/2/2007" | Date == "2/2/2007",] #get both dates

data2 <- data_datesubset #create a copy

#the next line adds a column to the datatable that is a datetime object
data2[,Datetime := unlist(lapply(paste(data2[,Date], data2[,Time]), FUN = strptime, format = "%d/%m/%Y %H:%M:%S", tz = "GMT"))]


png("plot3.png", width = 480, height = 480)
matplot(x = data2[,Datetime], 
       y = data2[,.(Sub_metering_1, Sub_metering_2, Sub_metering_3)], 
       type = c("l"), 
       col = c("black", "red", "blue"), 
       xaxt = "n", xlab = "", 
       ylab = "Energy sub metering")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col= c("black", "red", "blue"))
#plots the labels for Thursday, Friday, and Saturday by using their timestamp at 0:00:00.
axis(1, 
     c(1170288000, 1170374400, 1170460800), 
     c("Thursday", "Friday", "Saturday"))
dev.off()
