#pollutantmean("specdata", "nitrate", 70:72)
pollutantmean <- function(air_dir, air_pollutant, air_id){
  setwd(paste(c("./",air_dir),collapse =""))
  file_list <- dir(pattern = "*.csv")
  for(i in air_id){
    if (i == air_id[1]){
      air_id[1]
      air_dataframe <- read.csv(file_list[i])
      #print(paste(c("File #", i ," - ", file_list[i]),collapse =" "))
      #max(air_dataframe$ID)
    }
    else{
      air_id[1]
      temp_dataframe <- read.csv(file_list[i])
      #print(paste(c("File #", i ," - ", file_list[i]),collapse =" "))
      air_dataframe <- rbind(air_dataframe,temp_dataframe)
      #max(air_dataframe$ID)
    }
  }
  
  #pol <- as.name(paste(c("air_dataframe$",air_pollutant),collapse = ""))
  #air_dataframe$good <- complete.cases(pol)
  #pol <- as.name(paste(c("air_dataframe$",air_pollutant),collapse = ""))
  #print(pol)
  #air_dataframe$good <- complete.cases(air_dataframe$pol)
  
  
  
  if (air_pollutant == "sulfate"){
    air_dataframe$good <- complete.cases(air_dataframe$sulfate)
  }
  else if (air_pollutant == "nitrate"){
    air_dataframe$good <- complete.cases(air_dataframe$nitrate)
  }
  #print(class(air_dataframe))
  
  cal <- air_dataframe[air_dataframe$good, ] [air_pollutant]
  colnames(cal) <- c("pol")
  mean_cal <- mean(cal$pol)
  #print(mean_cal)
  mean_cal
  
}

#pol <- "sulfate"
#pollutantmean("specdata",pol,1:1)


#head(a$good)

#cal <- a[a$good, ] [pol]
#colnames(cal) <- c("pol")
#str(cal)

#mean(cal$pol)





