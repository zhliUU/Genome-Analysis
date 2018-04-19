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
module load FastQC #or fastqc?

# Your commands
output=../02_RNA_rawData_QC/FASTQC_results #TODO: locate the data correctly
touch repoerForFastQC
echo "Running fastqc..." > repoerForFastQC #save to some known file to check easiler
for file in ../data/RNA_raw_data/*.fastq.gz #works for compressed file
do
	fastqc -f fastq -o $output $file
done
cd $output
echo "Unzipping..." >> repoerForFastQC
for zip in *.zip
do
  unzip $zip
done
