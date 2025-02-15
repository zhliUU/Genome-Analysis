#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J 12_HTseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

python -m HTSeq.scripts.count -f bam -r name -t CDS -i ID \
/home/zhiwei94/Genome-Analysis/analyses/10_MergeBAM/ALLmerge/sorted-ALLout.bam \
/home/zhiwei94/Genome-Analysis/analyses/11_Output/test.gff\
> /home/zhiwei94/Genome-Analysis/analyses/12_HTseq/counts.file
