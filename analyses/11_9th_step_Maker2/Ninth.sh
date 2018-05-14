#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 48:00:00
#SBATCH -J 11_9thMaker
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load GeneMark/4.33-es
#TODO: change the parameters, -fungus is incorrect
gmes_petap.pl -ES -fungus -cores 10 -sequence /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/contig_download/sequence.fasta
