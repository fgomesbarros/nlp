#
# 02 - cleaning data
#

# 0. Sets up R env
rm(list = ls())
# require(readr)
# require(dplyr)
# require(quanteda)
set.seed(12881)

# 1. Sets up variables
sample_size = .2 

# 2. Call function tokenizer
source("scripts/03-tokenizer_file.R")

# 3. Get
txt_data <- tokenizer("data/final/en_US/en_US.blogs.txt", "english", .05)

