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

sbatch 5_Tophat_MappingRNA.sh /home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.1.fastq.gz \
/home/zhiwei94/Genome-Analysis/analyses/data/RNA_trimmed_data/SRR6040092_scaffold_11.2.fastq.gz\
for92
