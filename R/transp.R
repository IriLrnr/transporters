# load libraries
library(ggplot2)
library(gdata)

sig.hold <- sig.tables

source("format_data.R")

# Count number of genes with significative values (w/o repetition)
sig.rep <- data.frame()
count.sig <- 0
count.transp.sig <- 0
for (i in 1:length(sig.tables)) {
  new.genes <- as.data.frame(sig.tables[[i]]$orf)
  count.sig <- count.sig + nrow(new.genes)
  new.transp <- subset(new.genes, new.genes[,1] %in% transp$orf)
  count.transp.sig <- count.transp.sig + nrow(new.transp)
  sig.rep <- rbind(sig.rep, new.genes)
  sig.wo.rep <- distinct(sig.rep)
}
colnames(sig.wo.rep) <- c("orf")

gene.freqs <- data.frame(table(sig.rep))
colnames(gene.freqs)[[1]] <- c("orf")
summary(gene.freqs)

gene.freqs.transps <- subset(gene.freqs, gene.freqs$orf %in% transp$orf, c("orf", 'Freq'))
summary(gene.freqs.transps)

# check how many are transporters
sig.transp <- subset(sig.wo.rep, sig.wo.rep$orf %in% transp$orf) #121

# percentage of transporters in total number of sig genes
121/4810 # 0.02515593

count.transp.sig / count.sig

# ONLY POSITIVES

sig.rep <- data.frame()
sig.wo.rep.pos <- data.frame()
count.sig <- 0
count.transp.sig <- 0
for (i in 1:length(sig.tables)) {
  temp <- subset(sig.tables[[i]], sig.tables[[i]]$score > 0, c("orf"))
  new.genes <- as.data.frame(temp$orf)
  count.sig <- count.sig + nrow(new.genes)
  new.transp <- subset(new.genes, new.genes[,1] %in% transp$orf)
  count.transp.sig <- count.transp.sig + nrow(new.transp)
  sig.rep <- rbind(sig.rep, new.genes)
  sig.wo.rep.pos <- distinct(sig.rep)
}
colnames(sig.wo.rep.pos) <- c("orf")

# check how many are transporters
sig.transp <- subset(sig.wo.rep.pos, sig.wo.rep.pos$orf %in% transp$orf) #121

nrow(sig.transp)/nrow(sig.wo.rep.pos)

count.transp.sig / count.sig  # 0.02361624

gene.freqs <- data.frame(table(sig.rep))
colnames(gene.freqs)[[1]] <- c("orf")
summary(gene.freqs)

gene.freqs.transps <- subset(gene.freqs, gene.freqs$orf %in% transp$orf, c("orf", 'Freq'))
summary(gene.freqs.transps)

# ONLY NEGATIVES

sig.wo.rep.neg <- data.frame()
sig.rep <- data.frame()
count.sig <- 0
count.transp.sig <- 0
for (i in 1:length(sig.tables)) {
  temp <- subset(sig.tables[[i]], sig.tables[[i]]$score < 0, c("orf"))
  new.genes <- as.data.frame(temp$orf)
  count.sig <- count.sig + nrow(new.genes)
  new.transp <- subset(new.genes, new.genes[,1] %in% transp$orf)
  count.transp.sig <- count.transp.sig + nrow(new.transp)
  sig.rep <- rbind(sig.rep, new.genes)
  sig.wo.rep.neg <- distinct(sig.rep)
}
colnames(sig.wo.rep.neg) <- c("orf")

# check how many are transporters
sig.transp <- subset(sig.wo.rep.neg, sig.wo.rep.neg$orf %in% transp$orf) #121
nrow(sig.transp)/nrow(sig.wo.rep.neg)

count.transp.sig / count.sig  # 0.02361624

gene.freqs <- data.frame(table(sig.rep))
colnames(gene.freqs)[[1]] <- c("orf")
summary(gene.freqs)

gene.freqs.transps <- subset(gene.freqs, gene.freqs$orf %in% transp$orf, c("orf", 'Freq'))
summary(gene.freqs.transps)

# Conclusão qtd ~ 2.5% e abd ~ 2.3%


#Naural Products
