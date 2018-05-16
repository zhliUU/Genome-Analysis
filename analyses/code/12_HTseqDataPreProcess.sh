#load module
module load bioinfo-tools
module load htseq
#help
python -m HTSeq.scripts.count -h

python -m HTSeq.scripts.count -f bam -r name -o /home/zhiwei94/Genome-Analysis/analyses/12_HTse/HTseqCountOut /home/zhiwei94/Genome-Analysis/analyses/10_MergeBAM/ALLmerge/sorted-ALLout.bam /home/zhiwei94/Genome-Analysis/analyses/11_Output/NSDW01000011%2E1.gff
#TODO: .gff file contains a fasta file in the end
##!!!!!!#sed '/##FASTA/,$d' NSDW01000011%2E1.gff > test
python -m HTSeq.scripts.count -f bam -r name -i ID \
/home/zhiwei94/Genome-Analysis/analyses/10_MergeBAM/ALLmerge/sorted-ALLout.bam \
/home/zhiwei94/Genome-Analysis/analyses/11_Output/test.gff\
> /home/zhiwei94/Genome-Analysis/analyses/12_HTseq/counts.file

#-o /home/zhiwei94/Genome-Analysis/analyses/12_HTse/HTseqCountOut \
-o HTseqCountOut \

count.py -f bam -r name -o /home/zhiwei94/Genome-Analysis/analyses/12_HTse/HTseqCountOut /home/zhiwei94/Genome-Analysis/analyses/10_MergeBAM/ALLmerge/sorted-ALLout.bam /home/zhiwei94/Genome-Analysis/analyses/11_Output/NSDW01000011%2E1.gff
