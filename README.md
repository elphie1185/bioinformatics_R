# bioinformatics_R
bioinformatics workshop in R

## Performing quantitative RNA sequencing
Look at options to prepare read counts for annotated regions to identify the differentially expressed features in a genome.
Upstream steps include:  
- take high-throughput sequence reads 
- align them to a reference 
- produce files describing those alignments (such as .bam files) 

The dataset here is already prepared (modencodefly data from the NHGRI encyclopedia of DNA elements). We'll use a count table and an ExpressionSet (eset) object, which is an object type common in Bioconductor. The dataset contains 147 different samples for D. melanogaster, a fruit fly with an approximately 110 Mbp genome, annotated with about 15,000 gene features. 

Differential expresion with DESeq2
It's a method for differential analysis of count data, so it is ideal for RNAseq. It uses dispersion estimates and relative expression changes to strengthen estimates and modeling with an emphasis on improving gene ranking in results tables. It uses a geometric style normalization; the per lane scaling factor is computed as the median of the ratios of the gene count over its geometric mean ratio.

## Performing power analysis
To evaluate the power of the experimental design and optimise statistical sensitivity it will help define the number of replicates required. 
Using a treatments-a and control then data sets, we will estimate the number of replicates we need to spot differences in gene expression of a particular magnitude.
