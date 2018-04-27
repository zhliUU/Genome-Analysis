## 17th Apr:

##### **X** Install DESeq2

##### **X** Fix git ignore for .DS_Store and data folder

##### **X** Folder structure /data and each step folder:

​     data will be placed in data folder with symbolic link

##### **X** Prepare script

##### **TODO** Try fastQC locally and understand the output

## 19th Apr:

##### Submit the PacBio read assembly successfully

##### Understand the output of fastQC and discuss about it

In per base sequence quality for 11.1, it has bad quality in 100 end, need trimmed.

*when running the fastqc as sbatch job, it return error at some point, stopping the echo "unzipping"

For RNA reads, in Per base sequence content and Per sequence GC content bad behaviors could come from the transtomic are over representative sequence or from pollution, it might be okey when the evaluation is "**worning**"

## 24th&25th Apr:

##### Run trimmomatic for scaffold_11.1.fastq

##### Assembly evaluation fro PicBio assembly using Quast

evaluating the QC report: bad quality, move to using the genome from author

##### Make script for BWA （BWA-MEM）(skip due to bad quality)

##### Trimmomatic

##### Tophat run in loop









