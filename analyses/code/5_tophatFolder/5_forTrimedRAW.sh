#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J 5_Tophat97
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load bowtie2
module load tophat

#test ID
#mkdir /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/sample${SAMPLE_ID}
tophat -o /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40095TrimmedRAW \
-p 2 \
/home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/durio_zibe/05_Tophat_Mapping_RNA \
 /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_forward_paired.fq \
 /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_reverse_paired.fq
