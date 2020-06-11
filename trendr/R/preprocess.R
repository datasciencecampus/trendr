# Load raw data from .csv file
randomData <- read.csv("data-raw/randomData.csv")
japanGDPData <- read.csv("data-raw/japanGDPData.csv")
ukRainData <- read.csv("data-raw/ukRainData.csv")
# Apply preprocessing...
# Save the cleaned data in the required R package location
usethis::use_data(randomData, overwrite = TRUE)
usethis::use_data(japanGDPData, overwrite = TRUE)
usethis::use_data(ukRainData, overwrite = TRUE)