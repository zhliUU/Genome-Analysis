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
module load trinity

Trinity --seqType fq --max_memory 50G \
--left /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/reformat_forward_paired.fq \
--right /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/reformat_reverse_paired.fq \
--output /home/zhiwei94/Genome-Analysis/analyses/09_trinity/NoBAM/trinity \
--CPU 4

#--trimmomatic --quality_trimming_params "LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36" \
#--left /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_forward_paired.fq.gz \
#--right /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_reverse_paired.fq.gz \
#--trimmomatic --quality_trimming_params "LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36"\
#--left /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_forward_paired.fq.gz \
#--right /home/zhiwei94/Genome-Analysis/analyses/06_Trimmomatic_RNA_raw/output_reverse_paired.fq.gz \
#--left /home/zhiwei94/Genome-Analysis/analyses/data/RNA_raw_data/SRR6040095_scaffold_11.1.fastq.gz \
#--right /home/zhiwei94/Genome-Analysis/analyses/data/RNA_raw_data/SRR6040095_scaffold_11.2.fastq.gz \
