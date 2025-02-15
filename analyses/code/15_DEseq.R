setwd("/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq")
# Load DESeq2 library
library("DESeq2")


#####################for two arils set
sampleFiles<- c("40095counts.file",
                 "40094counts.file",
                 "40097counts.file",
                 "6066counts.file",
                 "6067counts.file",
                 "6069counts.file")
sampleNames <- c("MK aril 1", "MK aril 2", "MK aril 3", "MT aril 2", "MT aril 3", "MT aril 1")
sampleTissue <- c("MK", "MK", "MK", "MT", "MT", "MT")



sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, Tissue = sampleTissue)
directory <- "/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq"
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
										directory = directory,
										design = ~ Tissue)
treatments = c("MK", "MT")
colData(ddsHTSeq)$Tissue <- factor(colData(ddsHTSeq)$Tissue,
                                     levels = treatments)
#guts
dds <- DESeq(ddsHTSeq)
res <- results(dds)

#save original table
res <- res[order(res$padj),]
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'
write.csv(resdata, file = "-results-Sorted.csv")

# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
# DESeq2 has two options:  1) rlog transformed and 2) variance stabilization
# variance stabilization is very good for heatmaps, etc.
rld <- rlogTransformation(dds, blind=T)
vsd <- varianceStabilizingTransformation(dds, blind=T)
head( assay(rld) )
par( mfrow = c( 1, 2 ) )
plot( log2( 1+counts(dds, normalized=TRUE)[, 1:2] ), col="#00000020", pch=20, cex=0.3 )
plot( assay(rld)[, 1:2], col="#00000020", pch=20, cex=0.3 )

sampleDists <- dist( t( assay(rld) ) )
sampleDists
sampleDistMatrix <- as.matrix( sampleDists )
rownames(sampleDistMatrix) <- paste( rld$treatment, rld$patient, sep="-" )
colnames(sampleDistMatrix) <- NULL
library("gdata")
library( "gtools" )
library("caTools")
library( "gplots" )
library( "RColorBrewer" )
colours = colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap.2( sampleDistMatrix, trace="none", col=colours)
###Gene clustering###
library( "genefilter" )
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 17 )
heatmap.2( assay(rld)[ topVarGenes, ],
		margins=c(8,30), key = FALSE,
		scale="row", trace="none", dendrogram="column",
		col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))

vsd <- vst(dds, blind=FALSE)
pheatmap(assay(rld)[select,], cluster_rows=FALSE, show_rownames=FALSE, cluster_cols=TRUE)


################exclude MT aril2
sampleFiles<- c("40095counts.file",
                 "40094counts.file",
                 "40097counts.file",
                 "6067counts.file",
                 "6069counts.file")
sampleNames <- c("MK aril 1", "MK aril 2", "MK aril 3", "MT aril 3", "MT aril 1")
sampleTissue <- c("MK", "MK", "MK", "MT", "MT")



sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, Tissue = sampleTissue)
directory <- "/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq"
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
										directory = directory,
										design = ~ Tissue)
treatments = c("MK", "MT")
colData(ddsHTSeq)$Tissue <- factor(colData(ddsHTSeq)$Tissue,
                                     levels = treatments)
#guts
dds <- DESeq(ddsHTSeq)
res <- results(dds)
#save original table
res <- res[order(res$padj),]
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'
write.csv(resdata, file = "RmMT2-results-Sorted.csv")
# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
rld <- rlogTransformation(dds, blind=T)
sampleDists <- dist( t( assay(rld) ) )
sampleDists
sampleDistMatrix <- as.matrix( sampleDists )
rownames(sampleDistMatrix) <- paste( rld$Tissue )
colnames(sampleDistMatrix) <- NULL
colours = colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap.2( sampleDistMatrix, margins=c(8,30), key = FALSE, trace="none", col=colours)

###Gene clustering###
library( "genefilter" )
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 50 )
heatmap.2( assay(rld)[ topVarGenes, ],
		margins=c(8,30), key = FALSE,
		scale="row", trace="none", dendrogram="column",
		col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))

################compare inside one arils to leaf
sampleFiles<- c("40095counts.file",
                 "40094counts.file",
                 "40097counts.file",
                 "40092counts.file")
sampleNames <- c("MK aril 1", "MK aril 2", "MK aril 3", "MK leaf")
sampleTissue <- c("aril", "aril", "aril", "leaf")

sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, Tissue = sampleTissue)
directory <- "/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq"
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
										directory = directory,
										design = ~ Tissue)
treatments = c("aril", "leaf")
colData(ddsHTSeq)$Tissue <- factor(colData(ddsHTSeq)$Tissue,
                                     levels = treatments)
#guts
dds <- DESeq(ddsHTSeq)
res <- results(dds)
# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
rld <- rlogTransformation(dds, blind=T)
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 17 )
heatmap.2( assay(rld)[ topVarGenes, ],
		margins=c(8,30), key = FALSE,
		scale="row", trace="none", dendrogram="column",
		col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))

################compare inside one arils to root
sampleFiles<- c("40095counts.file",
                 "40094counts.file",
                 "40097counts.file",
                 "40093counts.file")
sampleNames <- c("MK aril 1", "MK aril 2", "MK aril 3", "MK root")
sampleTissue <- c("aril", "aril", "aril", "root")

sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, Tissue = sampleTissue)
directory <- "/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq"
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
										directory = directory,
										design = ~ Tissue)
treatments = c("aril", "leaf")
colData(ddsHTSeq)$Tissue <- factor(colData(ddsHTSeq)$Tissue,
                                     levels = treatments)
#guts
dds <- DESeq(ddsHTSeq)
res <- results(dds)
# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
rld <- rlogTransformation(dds, blind=T)
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 17 )
heatmap.2( assay(rld)[ topVarGenes, ],
		margins=c(8,30), key = FALSE,
		scale="row", trace="none", dendrogram="column",
		col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))

################compare inside one arils to stem
sampleFiles<- c("40095counts.file",
                 "40094counts.file",
                 "40097counts.file",
                 "40093counts.file")
sampleNames <- c("MK aril 1", "MK aril 2", "MK aril 3", "MK stem")
sampleTissue <- c("aril", "aril", "aril", "stem")

sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, Tissue = sampleTissue)
directory <- "/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq"
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
										directory = directory,
										design = ~ Tissue)
treatments = c("aril", "steam")
colData(ddsHTSeq)$Tissue <- factor(colData(ddsHTSeq)$Tissue,
                                     levels = treatments)
#guts
dds <- DESeq(ddsHTSeq)
res <- results(dds)
# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
rld <- rlogTransformation(dds, blind=T)
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 17 )
heatmap.2( assay(rld)[ topVarGenes, ],
		margins=c(8,30), key = FALSE,
		scale="row", trace="none", dendrogram="column",
		col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))

################compare inside one arils to all others
sampleFiles<- c("40095counts.file",
                 "40094counts.file",
                 "40097counts.file",
                 "40092counts.file",
                 "40093counts.file",
                 "40096counts.file")
sampleNames <- c("MK aril 1", "MK aril 2", "MK aril 3", "MK leaf", "MK root", "MK stem")
sampleTissue <- c("aril", "aril", "aril", "others", "others", "others")



sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, Tissue = sampleTissue)
directory <- "/Users/apple/Documents/GenoA/Genome-Analysis/analyses/12_HTseq"
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
										directory = directory,
										design = ~ Tissue)
treatments = c("aril", "others")
colData(ddsHTSeq)$Tissue <- factor(colData(ddsHTSeq)$Tissue,
                                     levels = treatments)
#guts
dds <- DESeq(ddsHTSeq)
res <- results(dds)
# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
rld <- rlogTransformation(dds, blind=F)
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 17 )
heatmap.2( assay(rld)[ topVarGenes, ],
		margins=c(8,30), key = FALSE,
		scale="row", trace="none", dendrogram="column",
		col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))
