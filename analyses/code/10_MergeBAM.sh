

#using 40095 40092 40093 40096, excluded: Monthong
#load samtools
module load samtools
#run concatenation
#it was run in the analyses directory, path to output not clear.
samtools merge 10_MergeBAM/out.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40095TrimmedRAW/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40092/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40093/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40096/accepted_hits.bam

#TODO: sort the BAM and index?
samtools sort out.bam > sorted-out.bam
samtools index sorted-out.bam


samtools merge 10_MergeBAM/ALLout.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40095TrimmedRAW/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40092/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40093/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40094/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40096/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample40097/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample6066/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample6067/accepted_hits.bam \
 /home/zhiwei94/Genome-Analysis/analyses/05_Tophat_Mapping_RNA/TophatSample5069/accepted_hits.bam
