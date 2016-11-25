#
# 03 - tokenizer file (function)
#

# 0. Reads packages needed
require(quanteda)
require(readr)
require(magrittr)

# 1. Function call
tokenizer <- function(file_path, language, fraction) {

  # Reads files
  txt <- read_lines(file_path)
  profanity <- read_csv("data/Terms-to-Block.csv")
  
  # Calculates new size
  new_size <- trunc(length(txt) * fraction)
    
  # Samples text vector
  txt <- quanteda::sample(x = txt, size = new_size)
  
  # Create corpus
  myCorpus <- corpus(txt)
  
  # Creates tokens and cleans txt
  txt_tk <- txt %>% 
    quanteda::tokenize(removeNumbers = TRUE, removePunct = TRUE, 
                       removeSeparators = TRUE, removeSymbols = TRUE, 
                       removeTwitter = TRUE) %>% 
    # Removes stop and profanity words 
    removeFeatures(stopwords(language)) %>% 
    removeFeatures(profanity$word)
  
  # Returns tokenized list
  return(txt_tk)
}