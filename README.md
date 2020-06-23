# bioinformatics_R
bioinformatics workshop in R

## Performing quantitative RNA sequencing
Look at options to prepare read counts for annotated regions to identify the differentially expressed features in a genome.
Upstream steps include:  
- take high-throughput sequence reads 
- align them to a reference 
- produce files describing those alignments (such as .bam files) 

The dataset here is already prepared (modencodefly data from the NHGRI encyclopedia of DNA elements). We'll use a count table and an ExpressionSet (eset) object, which is an object type common in Bioconductor. The dataset contains 147 different samples for D. melanogaster, a fruit fly with an approximately 110 Mbp genome, annotated with about 15,000 gene features. 
