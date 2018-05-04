#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J 5_Tophat66
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load bowtie2
module load tophat

#test ID
#mkdir /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/sample${SAMPLE_ID}
tophat -o /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample6066 \
-p 2 \
/home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/durio_zibe/05_Tophat_Mapping_RNA \
 home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156066_scaffold_11.1.fastq.gz \
 home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156066_scaffold_11.2.fastq.gz
