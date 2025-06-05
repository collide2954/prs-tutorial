library(data.table)

dat <- fread("EUR.QC.het")
# Get samples with F coefficient within 3 SD of mean
valid <- dat[F<=mean(F)+3*sd(F) & F>=mean(F)-3*sd(F)]

# write FID and IID for valid samples
fwrite(valid[,c("FID","IID")], "EUR.valid.sample", sep="\t")