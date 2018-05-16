#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 4_MappingIllumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
#TODO: create pipeline to convert sam to bam file as input for Pilon.
#TODO: For the first run, the input RNA reads are not trimmed!!<== WRONG, they are form trimmed folder!!!
# check if works with compressed data; check Input: bwa mem ref.fa read1.fq read2.fq > aln-pe.sam
bwa index /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio/durian.contigs.fasta
bwa mem /home/zhiwei94/Genome-Analysis/analyses/01_PacBio_genome_assembly/durian-pacbio/durian.contigs.fasta \
 /home/zhiwei94/Genome-Analysis/analyses/data/WGS_trimmed_data/SRR6058604_scaffold_11.1P.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/WGS_trimmed_data/SRR6058604_scaffold_11.2P.fastq.gz \
> /home/zhiwei94/Genome-Analysis/analyses/04_Mapping_PacBio_Assembly_Illumina/aln-pe.sam

#Convert from sam to bam:
#samtools view -S -b aln-pe.sam > aln-pe.bam
