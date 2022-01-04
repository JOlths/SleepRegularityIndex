# import module(s)
library(stats)
library(reshape2)
library(comprehenr)

# load data
data <- read.csv("test.csv")

compare_sleep <- function(list_to_compare){
  # function to calculate the amount of regularity of a sleeping-waking pattern
  
  # calculate difference in status between days
  result <- diff(list_to_compare)
  
  # remove Nan-values for list of differences, add one to each difference (e.g. 0 (no difference) becomes 1 etc.) and
  # calculate the residual when dividing by two (points where there is a difference will then be 1 and otherwise 0)
  result <- ((result[!is.na(result)])+1)%%2
  
  #calculate mean percentage of consistent status
  result <- sum(result)/length(result)

  return(result)
}

compare_sleep(c(1,1,1,0))

SRI_SCORE <- function(data, daily_datapoints, days){
  # Function to calculate the Sleep Regularity Index (SRI) for the given data
  # daily datapoints: 1440 (1-minute points), 2880 (30 second points)'''
  
  # reshape data into seperate days according to the daily datapoints
  sleep_data <- matrix(data, nrow = daily_datapoints, ncol = days)
  
  # calculate list of consistency at all daily datapoints
  consistency <- to_list(for (i in 1:nrow(sleep_data)) if (sum(!is.na(diff(sleep_data[i,])))>0) compare_sleep(sleep_data[i,]))
  consistency <- matrix(consistency, 1, length(consistency))
  
  # calculate RSI
  RSI <- round((200*(mean(as.numeric(consistency))-0.5)),2)
  
  return(RSI)
  
}

t <- c(0,0,1,1,0,0,0,1,0,1,1,1,0,0,1,1) # should be equal to 33.33

SRI_SCORE(t, daily_datapoints = 4, days = 4)
