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
module load bwa
# check if works with compressed data
bwa mem /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio/SRR6058604_scaffold_11.1P.fastq.gz /home/zhiwei94/Genome-Analysis/analyses/data/WGS_trimmed_data/read1.fq /home/zhiwei94/Genome-Analysis/analyses/data/WGS_trimmed_data/SRR6058604_scaffold_11.1P.fastq.gz > /home/zhiwei94/Genome-Analysis/analyses/03_Mapping_PacBio_Assembly_Illumina/aln-pe.sam
