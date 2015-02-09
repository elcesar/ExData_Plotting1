plot3 <- function(file_in = "Data/household_power_consumption.txt")
{
    data <- read_data(file = file_in)
    
    temp <- paste(data$Date, data$Time)
    data$fechahora <- strptime(temp, "%d/%m/%Y %H:%M:%S")
    
    print("plotting...")
    png(file="ExData_Plotting1//plot3.png")
    plot(data$fechahora, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data$fechahora, data$Sub_metering_2, type = "l", col= "red")
    lines(data$fechahora, data$Sub_metering_3, type = "l", col= "blue")
    dev.off()
    
}

read_data <- function(file = "Data/household_power_consumption.txt")
{
    print("reading data...")
    data <- read.csv2(file, nrows = -1)
    print("subsetting data...")
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    return(data)
}