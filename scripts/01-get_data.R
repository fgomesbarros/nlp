###############################################################################
#
# 01 - Get data
#
###############################################################################

# Download dataset file
url_file <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

if (!file.exists("data")) dir.create("data")

download.file(url = url_file, destfile = "data/Coursera-SwiftKey.zip")
unzip(zipfile = "data/Coursera-SwiftKey.zip", exdir = "data")
file.remove("data/Coursera-SwiftKey.zip")