#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 02:00:00
#SBATCH -J 12_HTseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

python -m HTSeq.scripts.count -f bam -r name -i ID \
/home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40093/SortAccepted.bam \
/home/zhiwei94/Genome-Analysis/analyses/11_Output/test.gff\
> /home/zhiwei94/Genome-Analysis/analyses/12_HTseq/40093counts.file
