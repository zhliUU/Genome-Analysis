#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:45:00 #too long?
#SBATCH -J 2_RNA_rawData_QC
#SBATCH --mail-type=ALL
#SBATCH --mail-user li120415323@gmail.com

# Load modules
module load bioinfo-tools
module load FastQC

# Your commands
output=../02_RNA_rawData_QC/FASTQCresults #TODO: locate the data correctly
echo "Running fastqc..."
for file in ../02_RNA_rawData_QC/*.fastq.gz #works for compressed file
do
	fastqc -f fastq -o $output $file
done
cd $output
echo "Unzipping..."
for zip in *.zip
do
  unzip $zip
done
