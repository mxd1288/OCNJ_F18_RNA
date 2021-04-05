# OCNJ_F18_RNA
Analysis of 3' RNA seq data from heart and brain tissue of Fundulus heteroclitus collected from Oyster Creek and reference populations in New Jersey in Fall 2018.
 Data files include:
1. cDNA_metadata_phenotypes.csv: contains all metadata
2. cDNA_F18_counts.csv: contains counts data prior to filtering (i.e. output from Featurcounts)

Code files include:
OCNJ_F18_RNA.RMD - an R Markdown file for analysis starting with raw counts table produced via Featurecounts and proceeding through data filtering for low count genes/low coverage individuals, differential gene expression between populations and temperatures, and production of figures.
