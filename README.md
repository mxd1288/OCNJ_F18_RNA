# OCNJ_F18_RNA
Analysis of 3' RNA seq data from heart and brain tissue of Fundulus heteroclitus collected from Oyster Creek and reference populations in New Jersey in Fall 2018.
 Data files include:
1. cDNA_metadata_phenotypes.csv: contains physiological data
2. cDNA_F18_OCNJ_MKD_metadata.csv: contains additional metadata
3. cDNA_F18_counts_2lanes.csv: contains counts data prior to filtering (i.e. output from Featurcounts from two lanes of sequencing)
4. heart_counts_filtered.csv: contains filtered counts table for heart samples
5. brain_counts_filtered.csv: contains filtered counts table for brain samples
6. funhe_annotations_eggnog_mapper_2021.csv: contains output from EGGnog mapper with annotations, KEGG and GO terms

Code files include:
1. OCNJ_F18_cDNA_DESeq.RMD - an R Markdown file for analysis starting with raw counts table produced via Featurecounts and proceeding through data filtering for low count genes/low coverage individuals, differential gene expression between populations and temperatures, and production of figures.

2. WGCNA_OCNJ_F18.RMD - an R Markdown file for co-expression analysis including mRNA ~ trait correlations and production of figures. 
