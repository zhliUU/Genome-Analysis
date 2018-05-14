#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 48:00:00
#SBATCH -J 11_Maker
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load maker/3.01.1-beta

maker -c 8 -q
