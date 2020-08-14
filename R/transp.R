library(dplyr)
library(ggplot2)
library(tidyr)

setwd("./data")
file.names <- dir()

number.spp=data.frame()

for (i in 1:(length(file.names)-1)){
  dados <- read.csv(paste(file.names[i]), head=TRUE, sep=";")
  number.spp <- rbind(number.spp, dados)
}
setwd("../")
