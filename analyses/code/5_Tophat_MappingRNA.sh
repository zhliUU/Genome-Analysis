#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00 #too long?
#SBATCH -J 5_Tophat_Mapping_test
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load tophat

forword=$1
reverse=$2
SAMPLE_ID=$3
#test ID

tophat -o /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/sample${SAMPLE_ID} \
-p 2 \
/home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/durio_zibe/05_Tophat_Mapping_RNA \
$forword $reverse
done
