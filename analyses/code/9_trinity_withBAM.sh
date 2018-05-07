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
#locat the bam correctly?
#change to the concatenated BAM file
Trinity --seqType fq --max_memory 50G \
--genome_guided_bam /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/sampleRNA_rawTrimmed_SRR6040095_out/accepted_hits.bam \
--genome_guided_max_intron 10000 \
--output /home/zhiwei94/Genome-Analysis/analyses/09_trinity/withBAM/trinity \
--CPU 4
