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
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.2.fastq.gz\
40092

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040093_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040093_scaffold_11.2.fastq.gz\
40093

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040094_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040094_scaffold_11.2.fastq.gz\
40094

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040096_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040096_scaffold_11.2.fastq.gz\
40096

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040097_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040097_scaffold_11.2.fastq.gz\
40097

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156066_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156066_scaffold_11.2.fastq.gz\
6066

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156067_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156067_scaffold_11.2.fastq.gz\
6067

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156069_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6156069_scaffold_11.2.fastq.gz\
6069
