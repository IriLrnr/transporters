library(dplyr)
library(ggplot2)
library(tidyr)
library(gdata)
library(rlist)
library(data.table)

read_and_filter <- function (x) {
  temp <- read.table(x, header = T, sep = "\t", quote="", dec = ".", fill = TRUE)
  temp <- temp[,c(2, 6, 8)]
  colnames(temp) <- c("orf", "score", "sig")
  temp <- subset(temp, temp$sig == "yes", c("orf", "score"))
  return(temp)
}

setwd("./data")
file.names <- dir()

file.names <- file.names[1:10]
list.all <- lapply(file.names, function(x) read_and_filter)
                   
                   FUN = read.table, header = T, sep = "\t", quote = "", fill = T)

list2 <- lapply(list.all, function(x) as.data.frame(subset(x, x[,8] == "yes", select = c(2, 6))))

list.new <- lapply(list.all, FUN = colnames, c("sig"))

list.2 <- lapply(list.all, FUN = subset,  == "yes", c(2, 6)))

sig.compounds.list <- list()
i = 1


for (i in 1:(3)) {
  temp <- read.table(file.names[i], header = T, sep = "\t", quote="", dec = ".", fill = TRUE)
  temp <- temp[,c(2, 6, 8)]
  colnames(temp) <- c("orf", "score", "sig")
  enriched <- subset(temp, temp$sig == "yes", c("orf", "score"))
  list.append(sig.compounds.list, enriched)
}
setwd("../")
sig_compounds_list
