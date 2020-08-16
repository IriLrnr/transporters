library(dplyr)
library(ggplot2)
library(gdata)
library(data.table)

setwd("./data")
file.names <- dir()

list.all <- lapply(file.names, FUN = read.table, header = T, sep = "\t", quote = "", fill = T)

for (i in 1:length(list.all)) {
  list.all[[i]] <- list.all[[i]][,c(2, 6, 8)]
  colnames(list.all[[i]]) <- c("orf", "score", "sig")
  list.all[[i]] <- subset(list.all[[i]], list.all[[i]]$sig == "yes", c("orf", "score"))
}
