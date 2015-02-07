
read_data <- function(){
  #Reads the data from the file, specifying colClasses for better performance.
  data <- read.table(
    "household_power_consumption.txt", 
    na.strings = "?", 
    sep=";", 
    header = TRUE, 
    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  )
  
  #Replaces the time olumn with the POSIXct of the date and time
  data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
  #Replaces the Date column with the same date converted to class Date
  data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
  #Subsets the data corresponding to the two dates specified in the instructions
  sub_data <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
  sub_data
}