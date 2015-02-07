source("./read_data.R")

#Set the working directory to the one this script is in, to run this.
plot_2 <- function(){
  data <- read_data()
  
  #Retrieves the current locale and changes it to English temporarily
  user_lang <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English") #Windows
  Sys.setlocale("LC_TIME", "en_US.UTF-8") #linux
  
  #Opens file device.
  png("plot2.png")
  
  #Creates the actual plot (see below)
  create_plot_2(data)
  
  #Closes device and sets locale back to original
  dev.off()
  Sys.setlocale("LC_TIME", user_lang)
}

create_plot_2 <- function(data){
  #Creates plot with labels
  plot(data$Time, data$Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
  #Adds lines
  lines(data$Time, data$Global_active_power, type="l")
}
