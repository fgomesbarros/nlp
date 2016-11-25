#
# Quiz 1
#

# 0. Prepare R env
rm(list = ls())
library(R.utils)
library(purrr)

# Question 1 - How many megabytes?
file.size("data/en_US/en_US.blogs.txt")
 
# Question 2 - How many lines of text?
countLines("data/en_US/en_US.twitter.txt")
 
# Question 3 - What is the length of the longest line seen in any of the three en_US data sets? 
data_dir <- "data/en_US/"
file_list <- list.files(data_dir)
max <- 0

for (i in 1:length(file_list)){
    file_name <- paste(data_dir, file_list[i], sep = "")
    con <- file(file_name, "r")
    while(TRUE) {
        text <- readLines(con, 10000)
        if(is_empty(text)) break
        max_char <- max(nchar(text))
        if(max_char > max) {
            max <- max_char
            big_line_file <- file_list[i]
            print(max)
            print(big_line_file)
        }
    }
    close(con)
}

# Question 4 - In the en_US twitter data set, if you divide the number of lines where the word "love" (all lowercase) occurs by the number of lines the word "hate" (all lowercase) occurs, about what do you get?
 
con <- file("data/en_US/en_US.twitter.txt", "r")
n_love <- 0
n_hate <- 0
while(TRUE) {
    tweets <- readLines(con, 10000)
    if(is_empty(tweets)) break
    n_love <- n_love + length(grep(pattern = "love", x = data))
    n_hate <- n_hate + length(grep(pattern = "hate", x = data))
}
close(con)
print(n_love/n_hate)

# Question 5 - The one tweet in the en_US twitter data set that matches the word "biostats" says what?

con <- file("data/en_US/en_US.twitter.txt", "r")
while(TRUE) {
    tweets <- readLines(con, 10000)
    if(is_empty(tweets)) break
    result <- grep(pattern = "biostat", x = data)
    if(!is_empty(result)) break
}
print(tweets[result])
close(con)

# Question 6 - How many tweets have the exact characters "A computer once beat me at chess, but it was no match for me at kickboxing". (I.e. the line matches those characters exactly.)

line_searched <- "A computer once beat me at chess, but it was no match for me at kickboxing"
n_lines <- 0

con <- file("data/en_US/en_US.twitter.txt", "r")
while(TRUE) {
    tweets <- readLines(con, 10000)
    if(is_empty(tweets)) break
    result <- grep(pattern = line_searched, x = tweets)
    if(length(result) > 0) {
        n_lines <- n_lines + length(result)
        print(n_lines)
    }
}
close(con)