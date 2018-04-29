#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 7_PilonImprove
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load Pilon

java -jar $PILON_HOME/pilon.jar --genome /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio/durian.contigs.fasta \
--bam /home/zhiwei94/Genome-Analysis/analyses/04_Mapping_PacBio_Assembly_Illumina/aln-pSorted.bam \
--threads 2 --output Durio_zibe_PilonPolished \
--outdir /home/zhiwei94/Genome-Analysis/analyses/07_Pilon_polish/
