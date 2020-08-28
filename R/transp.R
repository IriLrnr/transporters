source("./R/functions.R")
source("./R/format_data.R")

<<<<<<< HEAD
# Count number of genes with significative values without repetition
Print_Transporter_Ratio(sig.tables)
Print_Transporter_Ratio(syn.sig.tables)
Print_Transporter_Ratio(nat.sig.tables)
=======
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
>>>>>>> 18a98138461649cb2bed131c6e8ca014296ecaaa

# ONLY POSITIVES
sig.tables.pos <- lapply(sig.tables, FUN = subset, score > 0, c("orf", "score"))
Print_Transporter_Ratio(sig.tables.pos)
# ONLY NEGATIVES
<<<<<<< HEAD
sig.tables.neg <- lapply(sig.tables, FUN = subset, score < 0, c("orf", "score"))
Print_Transporter_Ratio(sig.tables.neg)
# ONLY NATURAL POSITIVES
nat.sig.tables.pos <- lapply(nat.sig.tables, FUN = subset, score > 0, c("orf", "score"))
Print_Transporter_Ratio(nat.sig.tables.pos)
# ONLYNATURAL NEGATIVES
nat.sig.tables.neg <- lapply(nat.sig.tables, FUN = subset, score < 0, c("orf", "score"))
Print_Transporter_Ratio(nat.sig.tables.neg)
# ONLY SYNTHETIC POSITIVES
syn.sig.tables.pos <- lapply(syn.sig.tables, FUN = subset, score > 0, c("orf"))
Print_Transporter_Ratio(syn.sig.tables.pos)
# ONLY SYNTETIC NEGATIVES
syn.sig.tables.neg <- lapply(syn.sig.tables, FUN = subset, score < 0, c("orf"))
Print_Transporter_Ratio(syn.sig.tables.neg)
=======

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

#ONLY NATURAL

sig.rep <- data.frame()
sig.wo.rep.nat <- data.frame()
count.sig <- 0
count.transp.sig <- 0
for (i in 1:length(nat.sig.tables)) {
  temp <- subset(nat.sig.tables[[i]], nat.sig.tables[[i]]$score > 0, c("orf"))
  new.genes <- as.data.frame(temp$orf)
  count.sig <- count.sig + nrow(new.genes)
  new.transp <- subset(new.genes, new.genes[,1] %in% transp$orf)
  count.transp.sig <- count.transp.sig + nrow(new.transp)
  sig.rep <- rbind(sig.rep, new.genes)
  sig.wo.rep.nat <- distinct(sig.rep)
}
colnames(sig.wo.rep.nat) <- c("orf")

# check how many are transporters
sig.transp <- subset(sig.wo.rep.nat, sig.wo.rep.nat$orf %in% transp$orf) 

nrow(sig.transp)/nrow(sig.wo.rep.nat)

count.transp.sig / count.sig  

gene.freqs <- data.frame(table(sig.rep))
colnames(gene.freqs)[[1]] <- c("orf")
summary(gene.freqs)

gene.freqs.transps <- subset(gene.freqs, gene.freqs$orf %in% transp$orf, c("orf", 'Freq'))
summary(gene.freqs.transps)

#ONLY SYNTHETIC
sig.rep <- data.frame()
sig.wo.rep.syn <- data.frame()
count.sig <- 0
count.transp.sig <- 0
for (i in 1:length(syn.sig.tables)) {
  temp <- subset(syn.sig.tables[[i]], syn.sig.tables[[i]]$score > 0, c("orf"))
  new.genes <- as.data.frame(temp$orf)
  count.sig <- count.sig + nrow(new.genes)
  new.transp <- subset(new.genes, new.genes[,1] %in% transp$orf)
  count.transp.sig <- count.transp.sig + nrow(new.transp)
  sig.rep <- rbind(sig.rep, new.genes)
  sig.wo.rep.syn <- distinct(sig.rep)
}
colnames(sig.wo.rep.syn) <- c("orf")

# check how many are transporters
sig.transp <- subset(sig.wo.rep.syn, sig.wo.rep.syn$orf %in% transp$orf) 

nrow(sig.transp)/nrow(sig.wo.rep.syn)

count.transp.sig / count.sig  

gene.freqs <- data.frame(table(sig.rep))
colnames(gene.freqs)[[1]] <- c("orf")
summary(gene.freqs)

gene.freqs.transps <- subset(gene.freqs, gene.freqs$orf %in% transp$orf, c("orf", 'Freq'))
summary(gene.freqs.transps)

# Conclusão qtd ~ 2.5% e abd ~ 2.3%
>>>>>>> 18a98138461649cb2bed131c6e8ca014296ecaaa
