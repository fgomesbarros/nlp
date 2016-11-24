#
# 03 - tokenizer file (function)
#

# 0. Reads packages needed
require(quanteda)
require(readr)

# 1. Function call
tokenizer <- function(file_path, language, fraction) {

  # Reads file
  txt <- read_lines(file_path)
  
  # Calculates new size
  new_size <- trunc(length(txt) * fraction)
    
  # Samples text
  txt <- quanteda::sample(x = txt, size = new_size)
  
  # Create corpus
  myCorpus <- corpus(txt)
  
  # Creates tokens
  txt_tk <- quanteda::tokenize(txt, removeNumbers = TRUE, removePunct = TRUE, 
                               removeSeparators = TRUE, removeSymbols = TRUE, 
                               removeTwitter = TRUE) 
  # Removes stop words
  txt_tk <- removeFeatures(txt_tk, stopwords(language))
  
  # Returns tokenizered list
  return(txt_tk)
}