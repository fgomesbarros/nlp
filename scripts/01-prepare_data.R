#
# 01 - Prepare data 
#

# 0. Prepare R env
rm(list = ls())
library(tm)

# Sets variables
corpus_dir <- "data/en_US/"

# 1. Creates Corpus 
documents <- Corpus(DirSource(directory = corpus_dir))
