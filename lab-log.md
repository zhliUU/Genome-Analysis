## 17th Apr:

##### Install DESeq2.

##### Fix git ignore for .DS_Store and data folder.

##### Folder structure /data and each step folder:

​     data will be placed in data folder with symbolic link

##### Prepare script for Canu(PacBio reads assembly)

##### **TODO** Try fastQC locally and understand the output

## 19th Apr:

##### Submit the PacBio read assembly successfully

##### Understand the output of fastQC and discuss about it

##### In per base sequence quality for 11.1, it has bad quality in 100 end, need trimmed.

(*when running the fastqc as sbatch job, it return error at some point, stopping the echo "unzipping")

For RNA reads, in Per base sequence content and Per sequence GC content bad behaviors could come from the transtomic are over **representative sequence** or from pollution, it might be okey when the evaluation is still "**worning**".

## 24th&25th Apr:

##### Run trimmomatic for DNA raw reads.

##### Assembly evaluation fro PicBio assembly using Quast.

Evaluating the QC report: bad quality, move to using the genome from author.

(https://www.ncbi.nlm.nih.gov/Traces/wgs/?val=NSDW01#contigs *scaffold 11)

##### Make script for BWA (BWA-MEM)

## 27th

##### Trimmomatic

##### Tophat run in loop

## 29th

##### Trimmomatic, trim the RNA_raw seq

## 4th May

##### Tophat in loop maynot be getting the files path correctly, I created specific batch file for each job.

Solved by running Tophat for each pair of RNA reads in terminal manually.

For trinity, use the BAM file from Tophat directly (merge selection of BAMs files).

##### Pilon for PacBio assembly reads improvement.



## 8th May

download relatedness protein in FASTA format

First step for maker pipeline

QC for trinity assembly?

## 9th May

May need to increase the core to speed up maker2 run.

To define the cores used, it also required to define when running maker:

```shell
maker -c 4 -q
```

## 14th May

Run maker step 7 with arabidopsis directly from step 1. 

Documentation

## 16th May

Run HTseq:

EggNOGmapper

## 17th May

##### DESeq2

##### IGV

## 22th May

Finish DEseq, IGV, Biological interpretation.