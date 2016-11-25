#
# 01 - Cleaning data
#

# 0. Sets up R env
rm(list = ls())
library(R.utils)
library(purrr)
library(tidytext)

# 1. Config variables
sample_size = .2
chunk_size = 1000
data_dir <- "data/en_US/"


# 2. Read file and get samples
file_list <- list.files(data_dir)
chunk <- as.list(NULL)

for (i in 1:length(file_list)){
    
    file_name <- file_list[i]
    file_path <- paste(data_dir, file_list[i], sep = "")
    
    con <- file(file_path, "r")

    while(TRUE) {
        txt <- readLines(con, 1, skipNul = TRUE)
        if(is_empty(txt)) break
        
        flag <- as.logical(rbinom(1, 1, sample_size))
        if(flag) {
            chunk[[file_name]] <- append(chunk[[file_name]], txt)    
        }
    }
    close(con)
}