##############################################################
#
# Performing Quantitative RNAseq DSeq from expression set
#
#############################################################

library(SummarizedExperiment)
load("./datasets/Chapter01/modencodefly_eset.RData" )
summ_exp <- makeSummarizedExperimentFromExpressionSet(modencodefly.eset)
ddsSE <- DESeqDataSet(summ_exp, design= ~ stage)
ddsSE <- DESeq(ddsSE)
resSE <- results(ddsSE, contrast=c("stage","L2Larvae","L1Larvae"))