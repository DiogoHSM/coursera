pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  pollutant_data <- c()
  files <- as.character( list.files(directory) )
  file_paths <- paste(directory, files, sep="")
  for(i in id) {
    file_loop <- read.csv(file_paths[i], header=T, sep=",")
    head(file_loop)
    pollutant
    na_removed <- file_loop[!is.na(file_loop[, pollutant]), pollutant]
    pollutant_data <- c(pollutant_data, na_removed)
  }
  result <- mean(pollutant_data)
  return(result) 
}

#setwd("~/Coursera/1-TDST/assignment1/")
#round(pollutantmean("./specdata/", "sulfate", 1:100),2) == 2.86
#round(pollutantmean("./specdata/", "sulfate", 20:30),2) == 1.8
#round(pollutantmean("./specdata/", "nitrate", 1:100),2) == 2.07
#round(pollutantmean("./specdata/", "nitrate", 200),2) == 2