## Reads quality control

- \-  What is the structure of a FASTQ file? 

  It used four lines per sequence: 

  (code for showing content: $ zcat < SRR6040095_scaffold_11.1.fastq.gz |head )

  **1:**@SRR6040095.1.1 HWI-ST840:508:HYLVFADXX:1:1101:1217:1966 length=101

  **2:**CCAGCTTGTAACCCGGGTGGGGGCAATAAGATCATGGAACATTGGTTCGATTCACCGAGTCGGGGCTATAATGGCTTGCCTCTGGCCTGCCCGTTCTAAGC

  **3:**+

  **4:**BCCDFFFFHHHHHJJIJCFGIJIIIJJJCHIGHIIJIIIIJIHGE;AEEFDEEDEEC@B=?BDD&00<>CC3>ABAA########################

  Line 1 starts with '@' and followed by a sequence identifier and an optional description. 2 is the raw sequence letters. Line 3 starts with '+' and is *optionally* followed by the same imformation as Line 1. Line 4 encodes the quelity values for the sequence in Line 2, mostly the same length as Line 2 seq.

- \-  How is the quality of the data stored in the FASTQ files? How are paired reads 

  identified? 

  The quality in coded in ASCII and '!' stands for lowest '~' stands for the highest.

  ```scheme
  !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
  ```

  In my case, the forward reads and reverse are differenciated by .1 and .2. Additionally inside the FASTQ files the sequence identifiers in Line 1 also contain .1 and .2 for forward and reverse reads.

- \-  How is the quality of your data? 

  By running fastQC, the results are:

  for forward reads, the per base sequence quality session, for position 90~97 their lower whiskers are in the red zone(calls of poor quality) as shown in the figure below. We have to trim the RNA raw data.![image-20180509113452921](/var/folders/f3/9n5djfxd7bbbhpxt8ngx5xp40000gn/T/abnerworks.Typora/image-20180509113452921.png)

  For RNA reads, in Per base sequence content and Per sequence GC content bad behaviors could come from the transtomic are over representative sequence or from pollution, it might be okey when the evaluation is "**worning**" 

  ??Kmer content indicates that the begining part has low quality. ===> trim more?

- \- What can generate the issues you observe in your data? Can these cause any 

  problems during subsequent analyses? 

  - Libraries which derive from random priming will nearly always show Kmer bias at the start of the library due to an incomplete sampling of the possible random primers.

  

## Reads preprocessing 

- \-  How many reads have been discarded after trimming? 

  1494547-1493963=584 (for illumina RNA reads, DNA reads are all trimmed.)

- \-  How can this affect your future analyses and results? 

  Extra time when running Tophat, lower quality?

- \-  How is the quality of your data after trimming? 

  In fastQC, Still complaining about kmer content, may need to change the parameters.

- \-  What do the LEADING, TRAILING and SLIDINGWINDOW options do? 

  - SLIDINGWINDOW: Perform a sliding window trimming, cutting once the average quality within the window falls below a threshold.
  - LEADING: Cut bases off the start of a read, if below a threshold quality
  - TRAILING: Cut bases off the end of a read, if below a threshold quality

## Genome assembly

- \-  What information can you get from the plots and reports given by the assembler (if you get any)? 

  ![Screen Shot 2018-05-14 at 5.04.03 PM](/Users/apple/Desktop/Screen Shot 2018-05-14 at 5.04.03 PM.png)

- \-  What intermediate steps generate informative output about the assembly? 

- \-  How many contigs do you expect? How many do you obtain? 

- \-  What is the difference between a ‘contig’ and a ‘unitig’? 

  Contigs, split at alternate paths in the graph

- \-  What is the difference between a ‘contig’ and a ‘scaffold’? 

- \-  What are the kmers? What kmer(s) should you use? What are the problems and benefits of choosing a small kmer? And a big kmer? 

- \-  Some assemblers can include a read-correction step before doing the assembly. What is this step doing? 

- \-  How different do different assemblers perform for the same data? 

  Not sure. Check lecture slides.

- \-  Can you see any other letter appart from AGTC in your assembly? If so, what are 

  those? 

  N: unsure?