##################################################
#
# Performing Quantitative RNAseq EdgeR
#
##################################################

library(edgeR)
library(magrittr)
library(readr)
library(forecats)

# load the eset data
phenoData <- load("./datasets/Chapter01/modencodefly_eset.RData" )

# specify the experiments of interest
experiments_of_interest <- c("L1Larvae", "L2Larvae")
columns_of_interest <- which(phenoData(modencodefly.eset)[["stage"]] %in% experiments_of_interest)

# form the grouping factor
grouping <- droplevels(phenoData(modencodefly.eset)[["stage"]][columns_of_interest])

# form a subset of count data
counts_of_interest <- exprs(modencodefly.eset)[, columns_of_interest]

# create the dge-object
eset_dge <- edgeR::DGEList(
  counts = counts_of_interest, 
  group = grouping)
)

# perform differential expression analysis
desing <- model.matrix(~ grouping)
eset_dge <- edgeR::estimateDisp(eset_dge, design)
result <- edgeR::glmQLFTest(fit, coef=2)
topTags(result)