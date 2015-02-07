source("./read_data.R")

#Set the working directory to the one this script is in, to run this.
plot_3 <- function(){
  data <- read_data()
  
  #Retrieves the current locale and changes it to English temporarily
  user_lang <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English") #Windows
  Sys.setlocale("LC_TIME", "en_US.UTF-8") #linux
  
  #Opens file device.
  png("plot3.png")
  
  #Creates the actual plot (see below)
  create_plot_3(data)
  
  #Closes device and sets locale back to original
  dev.off()
  Sys.setlocale("LC_TIME", user_lang)
}

create_plot_3 <- function(data, lengend.box.lty = 1){
  #Creates the plot with labels
  plot(data$Time, data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  
  #Adds the lines in different colors.
  lines(data$Time, data$Sub_metering_1, type="l")
  lines(data$Time, data$Sub_metering_2, type="l", col= "red")
  lines(data$Time, data$Sub_metering_3, type="l", col= "blue")
  
  #Adds the lengend
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, box.lty = lengend.box.lty)
}
