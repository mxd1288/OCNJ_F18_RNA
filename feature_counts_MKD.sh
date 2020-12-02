#!/bin/bash
#BSUB -J featurecounts
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o /projects/scratch/fun_gen_1/MKD/counts/featurecounts.out
#BSUB -e /projects/scratch/fun_gen_1/MKD/counts/featurecounts.err
#BSUB -n 8

~/software/local/subread-1.4.6-p5-Linux-x86_64/bin/featureCounts -T 8 \
-t gene \
-g gene_id \
-a /scratch/projects/fun_gen_1/MKD/GCF_011125445.2_MU-UCD_Fhet_4.1_genomic.gtf \
-o /scratch/projects/fun_gen_1/MKD/counts/SRR74495_featurecounts \
/scratch/projects/fun_gen_1/MKD/STAR_aligned/SRR*/*Aligned.sortedByCoord.out.bam