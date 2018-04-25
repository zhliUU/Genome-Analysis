#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 04_MappingIllumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
# check if works with compressed data
bwa mem /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio/SRR6058604_scaffold_11.1P.fastq.gz /home/zhiwei94/Genome-Analysis/analyses/data/WGS_trimmed_data/SRR6058604_scaffold_11.2P.fastq.gz > /home/zhiwei94/Genome-Analysis/analyses/04_Mapping_PacBio_Assembly_Illumina/aln-pe.sam
