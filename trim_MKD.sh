#!/bin/bash
#BSUB -J trimming
#BSUB -q general
#BSUB -P fun_gen_1
#BSUB -o /scratch/projects/fun_gen_1/MKD/SRAs/scripts/errors_and_outputs/trimmed
.out
#BSUB -e /scratch/projects/fun_gen_1/MKD/SRAs/scripts/errors_and_outputs/trimmed
.err
#BSUB -n 8

# creating variables and what not
deproj='/scratch/projects/fun_gen_1/MKD'

# making a list of sample names
files=`ls ${deproj}/SRAs | sed 's/\(SRR*.fastq\)/\1/g'`

# the files being processed
echo "samples being aligned"
echo $files

for file in $files
do
echo "$file"
echo '#!/bin/bash' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo '#BSUB -J '"$file"'' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo '#BSUB -e /scratch/fun_gen_1/MKD/SRAs/scripts/error_and_outputs/'"$file"'_error_trim.txt' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo '#BSUB -o /scratch/projects/fun_gen_1/MKD/SRAs/scripts/errors_and_outputs/'"$file"'_output_trim.txt' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo '#BSUB -q bigmem'  >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo '#BSUB -n 8' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo '#BSUB -R "rusage[mem=5000]"' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh

echo 'module load java' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo 'cd /scratch/projects/fun_gen_1/MKD/SRAs' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo 'bbduk.sh -Xms128m -Xmx128m in='"$file"' out='"$file"'.trimmed stats='"$file"'_stats.txt ref=~/software/local/bbmap/resources/truseq_rna.fa t=4 k=23 ktrim=r mink=11 hdist=1 tpe tbo' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo 'mv *trimmed* /scratch/projects/fun_gen_1/MKD/bbduk_out' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
echo 'mv *stats* /scratch/projects/fun_gen_1/MKD/bbduk_out/stats' >> /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
cd /scratch/projects/fun_gen_1/MKD/SRAs/scripts/
chmod +x SRR*
bsub < /scratch/projects/fun_gen_1/MKD/SRAs/scripts/"$file"_trim.sh
done