# load libraries
library(ggplot2)
library(gdata)

Print_Transporter_Ratio <- function (sig.tbls) {
  sig.rep <- data.frame()
  count.sig <- 0
  count.transp.sig <- 0
  for (i in 1:length(sig.tbls)) {
    new.genes <- as.data.frame(sig.tbls[[i]]$orf)
    count.sig <- count.sig + nrow(new.genes) # count total number of significatives
    new.transp <- subset(new.genes, new.genes[,1] %in% transp$orf)
    count.transp.sig <- count.transp.sig + nrow(new.transp)
    sig.rep <- rbind(sig.rep, new.genes)
    sig.wo.rep <- distinct(sig.rep)
  }
  colnames(sig.rep) <- c("orf")
  colnames(sig.wo.rep) <- c("orf")
  
  gene.freqs <- data.frame(table(sig.rep))
  colnames(gene.freqs)[[1]] <- c("orf")
  #print(summary(gene.freqs))
  #all.gene.freqs <- sweep(gene.freqs, count.sig, Freq, FUN = '/')
  #print(all.gene.freqs)
  
  gene.freqs.transps <- subset(gene.freqs, gene.freqs$orf %in% transp$orf, c("orf", 'Freq'))
  #print(summary(gene.freqs.transps))
  
  sig.transp <- subset(sig.wo.rep, sig.wo.rep$orf %in% transp$orf) #121
  
  print ("Ratio w/o repetition")
  print(nrow(sig.transp) / nrow(sig.wo.rep))
  print ("Ratio w repetition")
  print(count.transp.sig / count.sig)
  
}

