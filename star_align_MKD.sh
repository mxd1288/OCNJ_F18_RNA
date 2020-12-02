#!/bin/bash
#BSUB -J STAR_align
#BSUB -q general
#BSUB -P fun_gen_1
#BSUB -o /scratch/projects/fun_gen_1/MKD/STAR_aligned/star_align.out
#BSUB -e /scratch/projects/fun_gen_1/MKD/STAR_aligned/star_align.err
#BSUB -n 8

#creating variables and what not
deproj='/scratch/projects/fun_gen_1/MKD'

#making a list of sample names
files=`ls ${deproj}/bbduk_out/ | sed 's/\(SRR*\)/\1/g'`

#the files being processed
echo "samples being aligned"
echo "$files".fastq.trimmed

for file in $files
do
echo "$file"
echo '#!/bin/bash' > /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
echo '#BSUB -J '"$file"'' >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
echo '#BSUB -e /scratch/fun_gen_1/MKD/STAR_aligned/error_and_outputs/'"$file"'_error_alignment.txt' >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
echo '#BSUB -o /scratch/projects/fun_gen_1/MKD/STAR_aligned/error_and_outputs/'"$file"'_output_alignment.txt' >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
echo '#BSUB -q bigmem'  >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
echo '#BSUB -n 8' >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
echo '#BSUB -R "rusage[mem=5000]"' >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh

echo 'STAR \
--runThreadN 8 \
--genomeDir /scratch/projects/fun_gen_1/MKD/STAR_genome \
--sjdbGTFfile /scratch/projects/fun_gen_1/MKD/GCF_011125445.2_MU-UCD_Fhet_4.1_genomic.gtf \
--readFilesIn /scratch/projects/fun_gen_1/MKD/bbduk_out/'"$file"' \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /scratch/projects/fun_gen_1/MKD/STAR_aligned/'"$file"'/'"$file"'_' >> /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh #for alignment to symb
cd /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/
chmod +x "$file"_alignment.sh
bsub < /scratch/projects/fun_gen_1/MKD/STAR_aligned/scripts/"$file"_alignment.sh
done