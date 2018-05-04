tophat -o /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/sampleFor97 \
-p 2 \
/home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/durio_zibe/05_Tophat_Mapping_RNA \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040097_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040097_scaffold_11.2.fastq.gz\

tophat -o /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/sampleFor92 \
-p 2 \
/home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/durio_zibe/05_Tophat_Mapping_RNA \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.2.fastq.gz\

array=("SRR6040092" "SRR6040093" "SRR6040094" \
"SRR6040096" "SRR6040097" "SRR6156066" "SRR6156067" "SRR6156069")

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.2.fastq.gz 40092
Submitted batch job 2947604 pass

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040093_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040093_scaffold_11.2.fastq.gz\
 40093
 Submitted batch job 2947630 failed


sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040094_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040094_scaffold_11.2.fastq.gz \
 40094
 Submitted batch job 2947634 pass


sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040096_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040096_scaffold_11.2.fastq.gz \
 40096
Submitted batch job 2947639

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040097_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040097_scaffold_11.2.fastq.gz \
 40097
Submitted batch job 2947645 failed

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156066_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156066_scaffold_11.2.fastq.gz \
 6066
Submitted batch job 2947648

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156067_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156067_scaffold_11.2.fastq.gz \
 6067
Submitted batch job 2947649 failed

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156069_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156069_scaffold_11.2.fastq.gz \
 6069
Submitted batch job 2947653
