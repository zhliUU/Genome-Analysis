#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:45:00 #too long?
#SBATCH -J 6_trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load trimmomatic/0.36

# Commands

java -jar $TRIMMOMATIC_HOME/trimmomatic-0.36.jar PE \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_raw_data/SRR6040095_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_raw_data/SRR6040095_scaffold_11.2.fastq.gz \
output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
