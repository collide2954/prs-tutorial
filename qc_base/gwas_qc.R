library(data.table)

dat <- fread("Height.gwas.txt.gz")

# Filter out SNPs
result <- dat[INFO > 0.8 & MAF > 0.01]

# Output the result
fwrite(result, "Height.gz", sep="\t")