#!/bin/bash
#BSUB -J salmon_counts
#BSUB -q general
#BSUB -P fun_gen_1
#BSUB -o /scratch/projects/fun_gen_1/MKD/salmon_counts/salmon_error.out
#BSUB -e /scratch/projects/fun_gen_1/MKD/STAR_aligned/salmon_error.err
#BSUB -n 8

#creating variables and what not
deproj='/scratch/projects/fun_gen_1/MKD'

#making a list of sample names
files=`ls ${deproj}/bbduk_out/ | sed 's/\(SRR*\)/\1/g'`

#the files being processed
echo "samples being aligned"
echo "$files"_trimmed.fastq

for file in $files
do
echo "$file"
echo '#!/bin/bash' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
echo '#BSUB -J '"${file}"'' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
echo '#BSUB -q general' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
echo '#BSUB -P fun_gen_1' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
echo '#BSUB -e /scratch/projects/fun_gen_1/MKD/salmon_counts/error_and_outputs/'"$PALPAL"'_error_salmon.txt' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
echo '#BSUB -o /scratch/projects/fun_gen_1/MKD/salmon_counts/error_and_outputs/'"$PALPAL"'_output_salmon.txt' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job

echo 'echo "This is the sample being quantified -'"${file}"'"' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
echo 'salmon \
quant \
-i /scratch/projects/fun_gen_1/MKD/salmon_counts/funhe_salmon_index/ \
-l A \
-r /scratch/projects/fun_gen_1/MKD/bbduk_out/'"$file"' \
-o /scratch/projects/fun_gen_1/MKD/salmon_counts/salmon_quant/'"${file}"'_salmon' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job

echo 'echo "Sample '"${PALPAL}"' has been quantified and saved"' >> /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job

bsub < /scratch/projects/fun_gen_1/MKD/salmon_counts/scripts/"$file"_salmon_quant.job
done