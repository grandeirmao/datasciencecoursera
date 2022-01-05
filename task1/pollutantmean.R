#Part 1
#Write a function named 'pollutantmean' that calculates the mean of 
#a pollutant (sulfate or nitrate) across a specified list of monitors. 
#The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
#and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that 
#monitors' particulate matter data from the directory specified in the 
#'directory' argument and returns the mean of the pollutant across all 
#'of the monitors, ignoring any missing values coded as NA

pollutantmean <- function (directory, pollutant, id = 1:332) {
  
  tab <- list.files(directory, full.names = TRUE)
  value <- data.frame() #matrix organization
  
  for (i in id) {
  
    value <- rbind(value, read.csv(tab[i])) #read values in the .csv files and organize in matrices
    
  }
  
  #Calculate mean
    mean_data <- mean(value[, pollutant], na.rm = TRUE)
    return(mean_data)
  
}


