plot2 <- function(file_in = "Data/household_power_consumption.txt")
{
    data <- read_data(file = file_in)
    
    temp <- paste(data$Date, data$Time)
    data$fechahora <- strptime(temp, "%d/%m/%Y %H:%M:%S")
    
    data$Global_active_power <-  as.numeric(data$Global_active_power) / 1000
    
    print("plotting...")
    png(file="ExData_Plotting1//plot2.png")
    plot(data$fechahora, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
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