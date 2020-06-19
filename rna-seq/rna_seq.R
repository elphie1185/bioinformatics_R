##################################################
#
# Performing Quantitative RNAseq
# 
# Bioinformatics analysis using RNAseq data usually starts with a read QC step
# Then alugnment to a reference
# Transcript abundances are estimates with read couting and statistical models
# Differential expression between samples is assessed
#
##################################################

# Which transcripts are differentially expressed?
library(edgeR)
library(magrittr)
library(readr)
library(forecats)

# load the data
count_dataframe <- readr::read_tsv("./datasets/Chapter01/modencodefly_count_table.txt" )
genes <- count_dataframe[["gene"]]
count_dataframe[["gene"]] <- NULL
count_matrix <- as.matrix(count_dataframe)
rownames(count_matrix) <- genes

# specify the data of interest
experiments_of_interest <- c("L1Larvae", "L2Larvae")
columns_of_interest <- which( pheno_data[["stage"]] %in% experiments_of_interest ) 
pheno_data <- readr::read_table2( "./datasets/Chapter01/modencodefly_phenodata.txt")

# form the grouping factor
grouping <- pheno_data[["stage"]][columns_of_interest] %>% 
  forcats::as_factor()

# form the subset of count data
counts_of_interest <-  count_matrix[,columns_of_interest]

# create the dge object
count_dge <- edgeR::DGEList(counts = counts_of_interest, group = grouping)

# differential expression analysis
design <- model.matrix(~ grouping)
eset_dge <- edgeR::estimateDisp(count_dge, design)
fit <- edgeR::glmQLFit(eset_dge, design)
result <- edgeR::glmQLFTest(fit, coef=2)
topTags(result)