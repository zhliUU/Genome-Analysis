#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:45:00 #too long?
#SBATCH -J 8_ImpAssemQC
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load quast

# Your commands: It wasn't run through bash, but command line directly.
quast.py /pica/h1/zhiwei94/Genome-Analysis/analyses/07_Pilon_polish/Durio_zibe_PilonPolished.fasta \
 -R /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/contig_download/sequence.fasta \
-o /home/zhiwei94/Genome-Analysis/analyses/08_ImprovedAssemblyQC #TODO: locate the data correctly
