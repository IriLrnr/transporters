library(data.table)
library(dplyr)

# read and format data
compound.library <- read.csv("./data/compound_library.csv" , header = T, sep = ";", quote = "", fill = T)
transp <- read.csv("./data/transporters.csv", header = F)
colnames(transp) <- c("orf")

file.names <- dir("./data/compound/")
file.names <- file.names[1000:1100]
file.path <- paste0("./data/compound/", file.names)
sig.tables <- lapply(file.path, FUN = read.table, header = T, sep = "\t", quote = "", fill = T)
store.sig.tables <- sig.tables 
names(sig.tables) <- as.factor(file.names)

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
