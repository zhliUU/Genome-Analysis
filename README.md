Repository for the master’s-level course *Genome Analysis*. Over two months, this course provides hands-on experience with the University’s high-performance computing system, [UPPMAX](https://www.uu.se/en/centre/uppmax), and covers the design, execution, and documentation of a genomics research project.

Project focus: reproducing findings from the original paper, “[The draft genome of tropical fruit durian (Durio zibethinus)](https://www.nature.com/articles/ng.3972)” by Teh et al., *Nature Genetics*, 49, 1633–1641 (2017).

# Paper 5: Durian(Durio zibethinus) genome analyses

## Zhiwei LI

## 1. Aim of the project.
1. De novo assembly of Durian and do structural and functional annotation.
2. Transcriptome assembly and analyses differential expression.
3. Biological interpretation of the results.
4. Further analyses.

## 2. Type of analyses

Check [data description](https://github.com/zhliUU/Genome-Analysis/blob/master/data_description.md)
### Table of analyses and the employed application.

No reads quality control and reads preprocessing since we are working with PacBio reads.

| Analysis                                                     |             Type             |                           Software                           |                       Installed/codes                        |                   ERT                    | Input/note                                                   |
| :----------------------------------------------------------- | :--------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :--------------------------------------: | ------------------------------------------------------------ |
| 1.DNA assembly                                               |           Assembly           |                             Canu                             | UPPMAX/[1_gene_assembly.sh](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/1_gene_assembly.sh) |            **~17h (4 cores)**            | PacBio reads;                                                |
| 2.Mapping illlumia reads against assembly                    |       Mapping/Aligner        |                        BWA( BWA-MEM)                         | UPPMAX//[4_MappingIllumina.sh](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/4_MappingIllumina.sh) |                   ~ 1h                   | Illumina read to PacBio assembly (for BAM file as Pilon input) |
| 3. DNA assembly Improvement                                  |     Assembly Improvement     |                            Pilon                             | UPPMAX/[7_Pilon.sh](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/7_Pilon.sh) |                  ~30min                  | PacBio assembly; BAM file;                                   |
| 4. Assembly  evaluation ( must do after 3(Pilon), optional for 1(Canu)) |       Fasta sequences        |                            QUAST                             | Locally/[3_PacBio_AssemblyQC.sh](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/3_PacBio_AssemblyQC.sh) |                    ~                     | Assembly                                                     |
| RNA raw data quality check and trim and check again after trim |                              |                      FastQC Trimmomatic                      | UPPMAX/[2_RNA_rawData_QC.sh](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/2_RNA_rawData_QC.sh) |                    ~                     |                                                              |
| 5. Mapping (Aligner)                                         |        Eukaryotic RNA        |                            Tophat                            | UPPMAX/[5_tophatFolder/](https://github.com/zhliUU/Genome-Analysis/tree/master/analyses/code/5_tophatFolder) |            **~5h (2 cores)**             | Downloaded DNA sequence, different pairs of RNA reads. Part for 6, all for 10. |
| 6. RNA assembly                                              |         Illumina RNA         |                  Trinity(need map../no map)                  | UPPMAX/[9_trinity_withBAM.sh](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/9_trinity_withBAM.sh) |           **~5.5h (4 cores)**            | **Merged** BAM file from Tophat.                             |
| 7. Functional annotation                                     |          Eukaryotes          |                         EggNOGmapper                         | Online/Submitted online [output]( [13_EggNOGMapperNoScripts](https://github.com/zhliUU/Genome-Analysis/tree/master/analyses/13_EggNOGMapperNoScripts)) |                                          | maker.protein.fasta from Maker2                              |
| 8. Find relatedness proteins                                 |            FASTA             |                         Not provided                         | Download online: (arabidopsis) AND "Arabidopsis thaliana" in: [NCBI protein database]( https://www.ncbi.nlm.nih.gov/protein ) |                    -                     | Reduce the number of species to run faster  (used arabidopsis) |
| 9. Two iterations Annotation (structural)!!!first structural then functional!!! |          Eukaryotes          |                            Maker2                            | UPPMAX/[11_Maker2/](https://github.com/zhliUU/Genome-Analysis/tree/master/analyses/code/11_Maker2) | **Two iterations 6,12h(long) (4 cores)** | (Input: assembly trinity output and relatedness protein)     |
| 10. Read counting                                            |        Count features        |                            HTSeq                             | UPPMAX/[12_forEachPair_HTSeq/](https://github.com/zhliUU/Genome-Analysis/tree/master/analyses/code/12_forEachPair_HTSeq) |                    ~                     | BAM files from Tophat, gff from Maker2                       |
| 11.Differential Expression                                   |          Comparison          | (input:  																										HTSeq) DESeq2 (R library) | Locally, UPPMAX/[15_DEseq.R](https://github.com/zhliUU/Genome-Analysis/blob/master/analyses/code/15_DEseq.R) |                 Variable                 | counts from HTseq                                            |
| 12. Visualization of the genome                              | Reads and genomic annotation |                         IGV/Artemis                          |                           Locally                            |                 Variable                 | genome, .Gff, bam(one of each, then add more)                |

### Basic analyses:

●  Genome assembly of PacBio reads.

●  Correct the assembly with Illumina reads.

●  Assembly quality assessment.

●  Structural and functional annotation.

●  Transcriptome assembly.

●  Differential expression analyses.

●  Biological interpretation of the results.

### Extra analyses:

●  ~~Assembly with different parameters.~~

●  ~~Assembly evaluation with more than one method.~~

●  Deeper analyses of differential expression analyses: e.g. different comparisons.

### Time bottlenecks

The biggest bottleneck will be DNA assembly of PacBio reads(17h). RNA assembly, annotation and mapping will take more than 5h.



## 3. Time frame

Check [work log](https://github.com/zhliUU/Genome-Analysis/blob/master/lab-log.md)

## 4. Data handling

There are three types of data I have: RNA raw data, RNA trimmed data and WGS trimmed data. Thay are all fastq files.
