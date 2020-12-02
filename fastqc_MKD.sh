#!/bin/bash
#BSUB -J fastqc_srr
#BSUB -q general
#BSUB -P fun_gen_1
#BSUB -o /scratch/projects/fun_gen1/MKD/fastqc/fastqc_srr.out
#BSUB -e /scratch/projects/fun_gen1/MKD/fastqc/fastqc_srr.err
#BSUB -n 8

## change directory to location of fastq files
cd /scratch/projects/fun_gen_1/MKD/SRAs

## Loading modules required for script commands
module load fastqc

## Running FASTQC
fastqc -t 6 *.fastq

## Moving files to our results directory
mv *fastqc* ../fastqc