library(data.table)

dt <- fread("Height.nodup.gz", sep = "\t", header = FALSE)

# Define ambiguous SNPs
ambiguous <- (dt[[4]] == "A" & dt[[5]] == "T") |
             (dt[[4]] == "T" & dt[[5]] == "A") |
             (dt[[4]] == "G" & dt[[5]] == "C") |
             (dt[[4]] == "C" & dt[[5]] == "G")

# Count and print number of ambiguous SNPs
num_ambiguous <- sum(ambiguous)
cat("Number of ambiguous SNPs removed:", num_ambiguous, "\n")

# Filter out ambiguous SNPs
dt_nonambig <- dt[!ambiguous]

# Print number of non-ambiguous SNPs
cat("Number of non-ambiguous SNPs retained:", nrow(dt_nonambig), "\n")

# Write the result
fwrite(dt_nonambig, "Height.QC.gz", sep = "\t", quote = FALSE, col.names = FALSE, compress = "gzip")