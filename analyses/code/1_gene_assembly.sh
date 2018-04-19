#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J 1_gene_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load canu

# Your commands !!TODO locate the files correctly
#/home/zhiwei94/Genome-Analysis/analyses/data
canu \
 -p durian -d /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio \
 genomeSize=128m \
 -pacbio-raw /home/zhiwei94/Genome-Analysis/analyses/data/WGS_trimmed_data/SRR6037732_scaffold_11.fq.gz
\
