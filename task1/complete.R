#Part 2
#Write a function that reads a directory full of files and reports the number 
#of completely observed cases in each data file. The function should return 
#a data frame where the first column is the name of the file and the second 
#column is the number of complete cases.

complete <- function(directory, id = 1:332) {
  
  tab <- list.files(directory, full.names = TRUE)
  results <- data.frame(id = numeric(0), nobs = numeric(0))
  
  for (i in id) {
      value <- read.csv(tab[i]) #reading csv file
      interested_data <- value[(!is.na(value$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      nobs <- nrow(interested_data) ##row's number of valid cases
      results <- rbind(results, data.frame(id=i, nobs=nobs)) #organize the results
      }
  
  return(results)
  
}
