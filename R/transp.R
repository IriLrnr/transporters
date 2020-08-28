source("./R/functions.R")
source("./R/format_data.R")

# Count number of genes with significative values without repetition
Print_Transporter_Ratio(sig.tables)
Print_Transporter_Ratio(syn.sig.tables)
Print_Transporter_Ratio(nat.sig.tables)

# ONLY POSITIVES
sig.tables.pos <- lapply(sig.tables, FUN = subset, score > 0, c("orf", "score"))
Print_Transporter_Ratio(sig.tables.pos)
# ONLY NEGATIVES
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

