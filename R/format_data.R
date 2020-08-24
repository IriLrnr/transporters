library(data.table)
library(dplyr)

getwd()
# read and format data
setwd("./data")
compound.library <- read.csv("compound_library.csv" , header = T, sep = ";", quote = "", fill = T)
transp <- read.csv("transporters.csv", header = F)

colnames(transp) <- c("orf")

setwd("./compound")
file.names <- dir()
file.names <- file.names[1000:1300]
sig.tables <- lapply(file.names, FUN = read.table, header = T, sep = "\t", quote = "", fill = T)
store.sig.tables <- sig.tables 
names(sig.tables) <- as.factor(file.names)

setwd("../../")
table(compound.library$source)
sources <- as.data.frame(table(compound.library$source))

#Natural and Drug-Like Libraries
compound.source <- compound.library[,c(1,8)]
nat.compounds <- subset(compound.source, compound.source$source %in% sources[c(8,11,12,13),1], c("Screen.ID" , "source"))
syn.compounds <- subset(compound.source, !(compound.source$source %in% sources[c(8,11,12,13),1]), c("Screen.ID" , "source"))

nat.sig.tables <- list()
syn.sig.tables <- list()
for (i in 1:length(sig.tables)) {
  sig.tables[[i]] <- sig.tables[[i]][,c(2, 6, 8)]
  colnames(sig.tables[[i]]) <- c("orf", "score", "sig")
  sig.tables[[i]] <- subset(sig.tables[[i]], sig.tables[[i]]$sig == "yes", c("orf", "score"))
  if (names(sig.tables)[i] %in% nat.compounds$Screen.ID) {
    nat.sig.tables <- append(nat.sig.tables, sig.tables[i])
  } else {
    syn.sig.tables <- append(syn.sig.tables, sig.tables[i])
  }
}
