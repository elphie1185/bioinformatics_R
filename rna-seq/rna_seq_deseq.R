###################################################
#
# Performing Quantitative RNAseq DSeq
#
##################################################

# Which transcripts are differentially expressed?
library(DESeq2)
library(magrittr)
library(readr)
library(forecats)

# load the data
count_dataframe <- readr::read_tsv("./datasets/Chapter01/modencodefly_count_table.txt" )
genes <- count_dataframe[["gene"]]
count_dataframe[["gene"]] <- NULL
count_matrix <- as.matrix(count_dataframe)
rownames(count_matrix) <- genes
pheno_data <- readr::read_table2( "./datasets/Chapter01/modencodefly_phenodata.txt")

# specify the experiments of interes
experiments_of_interest <- c("L1Larvae", "L2Larvae")
columns_of_interest <- which( pheno_data[["stage"]] %in% experiments_of_interest ) 

# form the grouping factor
grouping <- pheno_data[["stage"]][columns_of_interest] %>% 
  forcats::as_factor()

# form the subset of count data
counts_of_interest <-  count_matrix[,columns_of_interest]

# create the dseq object
dds <- DESeqDataSetFromMatrix(countData = counts_of_interest,
                              colData = grouping,
                              design = ~ stage)

# carry out the analysis
dds <- DESeq(dds)

# differential expression analysis
res <- results(dds, contrast=c("stage","L2Larvae","L1Larvae"))