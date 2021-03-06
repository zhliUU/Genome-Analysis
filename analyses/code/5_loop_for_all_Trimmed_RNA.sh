#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:0:00 #too long?
#SBATCH -J 5_loop
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load tophat

read_PATH=/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/
array=("SRR6040092" "SRR6040093" "SRR6040094" "SRR6040096" "SRR6040097" "SRR6156066" "SRR6156067" "SRR6156069")
for SAMPLE_ID in "${array[@]}";
do
# ls SRR604009[2-7]_scaffold_11.1.fastq.gz
ls ${read_PATH}${SAMPLE_ID}_scaffold_11.1.fastq.gz \
| while read forward; do echo $forward; \
reverse=$(echo $forward|sed 's/1.fastq.gz$/2.fastq.gz/');\
echo $reverse; echo submitting job for ${SAMPLE_ID}...;
#echo make sure to enable the sbatch function and check the output folder
sbatch 5_Tophat_MappingRNA.sh $forward $reverse New_${SAMPLE_ID};
sleep 1 # pause to be kind to the scheduler
done
done
