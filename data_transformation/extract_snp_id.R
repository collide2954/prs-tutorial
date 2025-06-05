df <- read.table("EUR.clumped", header=TRUE)

valid_snp <- df[[3]]

write.table(valid_snp, file="EUR.valid.snp", quote=FALSE, row.names=FALSE, col.names=FALSE)