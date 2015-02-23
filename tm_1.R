library(tm)
library(stringr)
directory  <- "/Users/mac_warrior/Documents/R codes and projects/text mining commentary"
setwd(directory)
com_sample <- read.csv("Commentary_Sample.csv",stringsAsFactors = F)
com_sample <- com_sample[,2:3]
names(com_sample)[] <- c("Bowl_no","Info")

#Converting the bowl number to numeric
com_sample$Bowl_no <- as.numeric(as.character(com_sample$Bowl_no))

#Extracting only the useful data
com_sample <- com_sample[!(is.na(com_sample$Bowl_no)),]

list_com <- str_split(com_sample$Info,",")
list_com_1 <- lapply(list_com, `[[`, 1)
list_com_2 <- lapply(list_com, `[[`, 2)

bowler <- unlist(list_com_1)
result <- unlist(list_com_2)

comm_set <- data.frame(cbind(com_sample$Bowl_no,bowler,result))

#Converting Bowls to numeric and changing the column names

