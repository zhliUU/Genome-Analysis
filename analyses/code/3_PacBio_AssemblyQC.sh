#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:45:00 #too long?
#SBATCH -J 3_PacBio_AssemblyQC
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load quast

# Your commands: It wasn't run through bash, but command line directly
quast.py /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio/durian.contigs.fasta \
 -R /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/contig_download/sequence.fasta
output=/home/zhiwei94/Genome-Analysis/analyses/03_PacBio_AssemblyQC #TODO: locate the data correctly
touch repoerForPacBioQC
echo "Running quast..." > repoerForPacBioQC #save to some known file to check easiler


#cd $output
#echo "Unzipping..." >> repoerForFastQC
#for zip in *.zip
#do
#  unzip $zip
#done
