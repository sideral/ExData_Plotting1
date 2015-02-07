source("./read_data.R")

#Set the working directory to the one this script is in, to run this.
plot_1 <- function(){
  data <- read_data()
  png("plot1.png")
  hist(
    data$Global_active_power, 
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", 
    col= "red"
  )
  dev.off()
}
