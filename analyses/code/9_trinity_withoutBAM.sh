#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J 9_Trinity_NoBAM
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load Trinity

Trinity --seqType fq --max_memory 50G\
--output /home/zhiwei94/Genome-Analysis/analyses/09_Trinity/NoBAM \
#--genome_guided_bam \
--left /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_forward_paired.fq.gz \
--right /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_reverse_paired.fq.gz \
--CPU 4
