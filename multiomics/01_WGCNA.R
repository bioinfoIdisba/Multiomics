library(readxl)
pheno<-read_excel("./nomenclatura.xlsx")
# Load the WGCNA package
library(WGCNA);
# The following setting is important, do not omit.
options(stringsAsFactors = FALSE)
#Read in the female liver data set
pheno<-read_excel("./nomenclatura.xlsx")
# Take a quick look at what is in the data set:
dim(pheno)
names(pheno)

datExpr0 = as.data.frame(t(femData[, -c(1:8)]));
names(datExpr0) = femData$substanceBXH;
rownames(datExpr0) = names(femData)[-c(1:8)]