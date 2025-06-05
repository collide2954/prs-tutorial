library(data.table)

valid <- fread("EUR.valid.sample")
dat <- fread("EUR.QC.sexcheck")[FID %in% valid$FID]

valid_inds <- dat[STATUS == "OK", .(FID, IID)]

fwrite(valid_inds, "EUR.QC.valid", sep="\t")

num_excluded <- nrow(dat) - nrow(valid_inds)
cat("Number of individuals excluded:", num_excluded, "\n")
