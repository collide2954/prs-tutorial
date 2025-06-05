library(data.table)
dat <- fread("Height.QC.gz")
fwrite(dat[,BETA:=log(OR)], "Height.QC.Transformed", sep="\t")