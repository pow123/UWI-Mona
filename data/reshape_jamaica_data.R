library(tidyr)
library(reshape2)

data1 <- read.csv("jamaica-worldbank-data.csv", header = T, na.strings = "NA", check.names = FALSE)
longdata1 <- melt(data1, id.vars = c("Country Name","Country Code","Indicator Name","Indicator Code"))
jdata <- longdata1[,c(1,3,5:6)]

jdata2 <- spread(jdata, "Indicator Name", value)

write.csv(jdata2, file = "jamaica-worldbank-data-1.0.csv")
