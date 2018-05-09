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

  ```shell
  !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
  ```

  In my case, the forward reads and reverse are differenciated by .1 and .2. Additionally inside the FASTQ files the sequence identifiers in Line 1 also contain .1 and .2 for forward and reverse reads.

- \-  How is the quality of your data? 

  By running fastQC, the results are:

  for forward reads, the per base sequence quality session, for position 90~97 their lower whiskers are in the red zone(calls of poor quality) as shown in the figure below. We have to trim the RNA raw data.![image-20180509113452921](/var/folders/f3/9n5djfxd7bbbhpxt8ngx5xp40000gn/T/abnerworks.Typora/image-20180509113452921.png)

  ?The quality of calls on most platforms will degrade as the run progresses, so it is common to see base calls falling into the orange area towards the end of a read.?

-   What can generate the issues you observe in your data? Can these cause any 

  problems during subsequent analyses? 