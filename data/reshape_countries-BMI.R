#install.packages("reshape2")
#install.packages("tidyr")

#load libraries
library(reshape2)
library(tidyr)

#check where you are
getwd()

#move to the right folder/directory
setwd("~/Desktop/UWI-Mona/UWI-curriculum/contents/data/")

#load data
cdata <- read.csv("countries-BMI-1.0.csv", skip = 2, header = F)

#check the file
head(cdata)

#create header by combining top two rows
headers <- read.csv("countries-BMI-1.0.csv", nrows=2, header=FALSE)
headers_names <- sapply(headers,paste,collapse="_")

#add the new header to our data frame
names(cdata) <- headers_names

#see the result
head(cdata)

#transpose the "wide data" to make it tidy/long
longdata <- melt(cdata, id.vars = c("_Country"))

#separate the year and sex columns
countriesBMI2 <- separate(data = longdata, col = variable, into = c("Year", "Sex"), sep = "_")

#replace "no data" with nulls
countriesBMI2$value[countriesBMI2$value == "No data"] <- NA

#separate the BMI averages from the standard deviation range
countriesBMI2 <- separate(data = countriesBMI2 ,col = value, into = c("BMI", "Error"), sep = " ")

#check to see
head(countriesBMI2)

#save the data frame as a CSV file in your computer
write.csv(countriesBMI2, file = "countries-BMI-2.0.csv")
