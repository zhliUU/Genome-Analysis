# Paper 5: Durian genome analyses

## 1. Aim of the project.

1. De novo assembly of Durian and do structural and functional annotation.
2. Transcriptome assembly and analyses differential expression.
3. Biological interpretation of the results.
4. Further analyses.

## 2. Type of analyses

### Table of analyses and the employed application.

No reads quality control and reads preprocessing since we are working with PacBio reads.

| Analysis                                                     |             Type             |                           Software                           |    Installed    |                   ERT                    | Input/note                                               |
| :----------------------------------------------------------- | :--------------------------: | :----------------------------------------------------------: | :-------------: | :--------------------------------------: | -------------------------------------------------------- |
| 1.DNA assembly                                               |            PacBio            |                             Canu                             |     UPPMAX      |            **~17h (4 cores)**            | PacBio reads;                                            |
| 2.Mapping illlumia reads against assembly (for BAM file as Pilon input) |       Mapping/Aligner        |                             BWA                              |     UPPMAX      |                   ~ 1h                   | PacBio assembly; Illumina read;                          |
| 3. DNA assembly Improvement                                  |     Assembly Improvement     |                            Pilon                             |     UPPMAX      |                  ~30min                  | PacBio assembly; BAM files;                              |
| 4. Assembly  evaluation ( must do after 3(Pilon), optional for 1(Canu)) |       Fasta sequences        | QUAST																								(MUMmerplot) |     Locally     |                    ~                     | assembly                                                 |
| RNA raw data quality check and trim and check again after trim |                              |                      FastQC Trimmomatic                      |     UPPMAX      |                    ~                     |                                                          |
| 5. Mapping (Aligner)                                         |        Eukaryotic RNA        |                            Tophat                            |     UPPMAX      |            **~5h (2 cores)**             | Part for 6, all for 10.                                  |
| 6. RNA assembly                                              |         Illumina RNA         |                  Trinity(need map../no map)                  |     UPPMAX      |           **~5.5h (4 cores)**            |                                                          |
| 7. Annotation (functional)                                   |          Eukaryotes          |                         EggNOGmapper                         |     Online      |                                          | Input for 10?                                            |
| 8. Find relatedness proteins                                 |            FASTA             |                         Not provided                         |        -        |                    -                     | Reduce the number of species to run faster               |
| 9. Two iterations Annotation (structural)                    |          Eukaryotes          |                            Maker2                            |     UPPMAX      | **Two iterations 6,12h(long) (4 cores)** | (Input: assembly trinity output and relatedness protein) |
| 10. Read counting                                            |        Count features        |                            HTSeq                             |     UPPMAX      |                    ~                     |                                                          |
| 11.Differential Expression                                   |          Comparison          | (input:  																										HTSeq) DESeq2 (R library) | Locally, UPPMAX |                 Variable                 |                                                          |
| 12. Visualization of the genome                              | Reads and genomic annotation | ( input:																										EggNOGmapper) IGV |     Locally     |                 Variable                 |                                                          |

### Basic analyses:

●  Genome assembly of PacBio reads.

●  Correct the assembly with Illumina reads.

●  Assembly quality assessment.

●  Structural and functional annotation.

●  Transcriptome assembly.

●  Differential expression analyses.

●  Biological interpretation of the results.

### Extra analyses:

●  Assembly with different parameters.

●  Assembly evaluation with more than one method.

●  Deeper analyses of differential expression analyses: e.g. different comparisons.

### Time bottlenecks

The biggest bottleneck will be DNA assembly of PacBio reads(17h). RNA assembly, annotation and mapping will take more than 5h.



## 3. Time frame

| Week | Focus                       |
| :--- | :-------------------------- |
| 14   | Setup Github; Documentation |
| 15   | Documentation;              |
| 16   | 1,2,3                       |
| 17   | 4,5,6                       |
| 18   | 7,8,9                       |
| 19   | 10,11,12                    |
| 20   |                             |
| 21   |                             |

## 4. Data handling

There are three types of data I have: RNA raw data, RNA trimmed data and WGS trimmed data. Thay are all fastq files.