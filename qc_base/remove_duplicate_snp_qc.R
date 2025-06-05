library(data.table)

dt <- fread("Height.gz", sep = "\t", header = FALSE)

# Find duplicated SNP values
dup_mask <- duplicated(dt[[3]])

# SNP_dup count
num_duplicates <- sum(dup_mask)
cat("Number of duplicate SNPs:", num_duplicates, "\n")

# Keep only the first occurrence of each SNP
dt_nodup <- dt[!dup_mask]

# Write the result
fwrite(dt_nodup, "Height.nodup.gz", sep = "\t", quote = FALSE, col.names = FALSE, compress = "gzip")