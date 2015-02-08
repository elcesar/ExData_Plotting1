plot1 <- function(file_in = "Data/household_power_consumption.txt")
{
    data <- read_data(file = file_in)
    GAP <- as.numeric(data$Global_active_power) / 1000
    print("plotting...")
    png(file="ExData_Plotting1//plot1.png")
    hist(GAP,main="Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")
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