#
# 02 - cleaning data
#

# 0. Sets up R env
rm(list = ls())
require(readr)
require(dplyr)
require(quanteda)
set.seed(12881)

# 1. Sets up variables
dir_files <- "data/final/en_US/"
language <- "english"
fraction = .005 

# 2. Call function tokenizer
source("scripts/03-tokenizer_file.R")

# 3. Get data
file_path <- dir(dir_files, full.names = TRUE)

for(i in file_path){
  # Tokenizers files
  temp <- tokenizer(i, language, fraction)
  
  # Creates dfm 
  temp_dfm <- dfm(temp, toLower = TRUE)
  
  # Rbind all
  if(!exists("my_dfm")){
    my_dfm <- temp_dfm
  } else {
    my_dfm <- rbind(temp_dfm, my_dfm)
  }
}