source("./read_data.R")
source("./plot2.R")
source("./plot3.R")

#Set the working directory to the one this script is in, to run this.
plot_4 <- function(){
  data <- read_data()
  
  #Retrieves the current locale and changes it to English temporarily
  user_lang <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English") #Windows
  Sys.setlocale("LC_TIME", "en_US.UTF-8") #linux
  
  #Opens file device.
  png("plot4.png")
  
  create_plot_4(data)
  
  #Closes device and sets locale back to original
  dev.off()
  Sys.setlocale("LC_TIME", user_lang)
}

create_plot_4 <- function(data){
  #Sets number of columns and rows
  par(mfcol = c(2, 2))
  
  #Calls the functions defined in plot2.R and plot3.R to add the corresponding plots
  create_plot_2(data)
  create_plot_3(data)
  
  #Creates the Voltage plot
  plot(data$Time, data$Voltage, type="n", xlab = "datetime", ylab = "Voltage")
  lines(data$Time, data$Voltage, type="l")
  
  #Creates the Global_reactive_power plot
  plot(data$Time, data$Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(data$Time, data$Global_reactive_power, type="l")
}
