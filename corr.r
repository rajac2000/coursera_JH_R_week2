corr <- function(air_dir, threshold = 0){
  setwd(paste(c("./",air_dir),collapse =""))
  file_list <- dir(pattern = "*.csv")
  new_df <- c()
  for(i in seq_along(file_list)){
      temp_dataframe <- read.csv(file_list[i])
      temp_dataframe$good <- complete.cases(temp_dataframe)
      y <- temp_dataframe[temp_dataframe$good,][1]
      if (length(y[,1]) > threshold){
         x <- temp_dataframe[temp_dataframe$good, ] [2:3]
         new_df <- c(new_df,cor(x[,1],x[,2])) #,use="na.or.complete"))
         rm(temp_dataframe)
         rm(x)
      }
  }
  new_df  
}

