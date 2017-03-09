## load library
  library(dplyr)
  library(tabulizer)
  
## download pdf files
  baseURL <- "http://dhsprogram.com/pubs/pdf/OF31/OF31."
  state_feed <- read.csv("state_feed.csv",stringsAsFactors = F) 
  
  setwd("data_files")
  
  ## download files
  for(i in 1:nrow(state_feed)){
    url2fetch <- paste0(baseURL,state_feed$Abb[i],".pdf")
    download.file(url2fetch,paste0(state_feed$Abb[i],".pdf"),mode = "wb")
  }
  
  ## read files
  f <- system.file("examples", "AN.pdf", package = "tabulizer")
  out1 <- extract_tables("AN.pdf",pages = 3)
  str(out1)
  