#
# 01 - Cleaning data
#

# 0. Sets up R env
rm(list = ls())
set.seed(9220)
require(readr)
require(tidytext)
require(dplyr)

# 1. Config variables
sample_size = .2
data_dir <- "data/en_US/"
profanity_file <- "data/Terms-to-Block.csv"

# 2. Read file and get samples
file_list <- list.files(data_dir)

for (i in 1:length(file_list)){
    file_name <- file_list[i]
    file_path <- paste(data_dir, file_list[i], sep = "")
    
    text_lines <- read_lines(file_path)
    
    text_df <- data.frame(linenumber = 1:length(text_lines), 
                          text = text_lines, stringsAsFactors = FALSE) %>% 
        tbl_df() %>% 
        sample_frac(sample_size) %>% 
        mutate(book = file_list[i])
 
    if(!exists("docs")){
        text_td <- text_df
    } else {
        text_td <- bind_rows(docs, text_df)    
    }
}   

# 3. Tokenizer text and remove stop and profanity words
data("stop_words")
bad_words <- read_csv(profanity_file)

text_td <- text_td %>% 
    unnest_tokens(word, text) %>% 
    anti_join(stop_words) %>% 
    anti_join(bad_words)