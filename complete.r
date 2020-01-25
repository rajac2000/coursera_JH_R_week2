#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25)
#complete("specdata", 3)

complete <- function(air_dir, air_id){
  setwd(paste(c("./",air_dir),collapse =""))
  file_list <- dir(pattern = "*.csv")
  new_df <- data.frame()
  #new_df <- data.frame(NA,NA)
  #new_df <- new_df[-1,]
  for(i in seq_along(air_id)){
      air_id[i]
      temp_dataframe <- read.csv(file_list[air_id[i]])
      temp_dataframe$good <- complete.cases(temp_dataframe)
      x <- temp_dataframe[temp_dataframe$good, ] [5]
      new_df <- rbind(new_df,c(air_id[i],length(x$good)))
      rm(temp_dataframe)
      rm(x)
  }
  
colnames(new_df) <- c("id","nobs")
new_df  
}
