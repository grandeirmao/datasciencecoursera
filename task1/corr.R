#Part 3
#Write a function that takes a directory of data files and a threshold for 
#complete cases and calculates the correlation between sulfate and nitrate 
#for monitor locations where the number of completely observed cases 
#(on all variables) is greater than the threshold. The function should 
#return a vector of correlations for the monitors that meet the threshold 
#requirement. If no monitors meet the threshold requirement, then the function 
#should return a numeric vector of length 0.

corr <- function(directory, threshold = 0) {
  
  tab <- list.files(directory, full.names = TRUE)
  
  cor_results <- numeric(0)
  
  valid_cases <- complete(directory) #encontra todos os casos válidos
  valid_cases <- valid_cases[valid_cases$nobs>=threshold, ] #filtra todos os casos que sejam maior/igual ao threshold
  
  if (nrow(valid_cases) > 0) {
    for (monitor in valid_cases$id) {
      value <- read.csv(tab[monitor])
      interested_data <- value[(!is.na(value$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      interested_sulfate <- interested_data["sulfate"]
      interested_nitrate <- interested_data["nitrate"]
      cor_results <- c(cor_results, cor(interested_sulfate, interested_nitrate))
    }
  }
  return(cor_results)
}