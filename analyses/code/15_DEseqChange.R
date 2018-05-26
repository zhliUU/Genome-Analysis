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
# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
#print the res to see how many genes are significant
#res
rld <- rlogTransformation(dds, blind=T)
vsd <- varianceStabilizingTransformation(dds, blind=T)

ddsClean <- replaceOutliersWithTrimmedMean(dds)
ddsClean <- DESeq(ddsClean)
resClean <- results(ddsClean)
resClean = subset(res, padj<0.05)
resClean <- resClean[order(resClean$padj),]
select <- order(1(ddsClean,normalized=T)),decreasing=T)[1:1000]
my_palette <- colorRampPalette(c("blue",'white','red'))(n=1000)
heatmap.2(assay(vsd)[select,], col=my_palette,
          scale="row", key=F, keysize=1, symkey=T,
          density.info="none", trace="none",
          cexCol=0.6, labRow=F,
          main="1000 Top Expressed Genes Heatmap")


###############################
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
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
rld <- rlogTransformation(dds, blind=T)
vsd <- varianceStabilizingTransformation(dds, blind=T)

ddsClean <- replaceOutliersWithTrimmedMean(dds)
ddsClean <- DESeq(ddsClean)
resClean <- results(ddsClean)
resClean = subset(res, padj<0.05)
resClean <- resClean[order(resClean$padj),]
select <- order(rowMeans(counts(ddsClean,normalized=T)),decreasing=T)[1:1000]
my_palette <- colorRampPalette(c("blue",'white','red'))(n=1000)
heatmap.2(assay(vsd)[select,], col=my_palette,
          scale="row", key=F, keysize=1, symkey=T,
          density.info="none", trace="none",
          cexCol=0.6, labRow=F,
          main="1000 Top Expressed Genes Heatmap noMTaril2")


sampleDists <- dist( t( assay(rld) ) )
sampleDists
sampleDistMatrix <- as.matrix( sampleDists )
rownames(sampleDistMatrix) <- paste( rld$treatment, rld$Tissue )
colnames(sampleDistMatrix) <- NULL
colours = colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap.2( sampleDistMatrix, trace="none", key=F, col=colours)

#####################
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
#res <- res[order(res$padj),]
#resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
#names(resdata)[1] <- 'gene'
#write.csv(resdata, file = "MK-Arils-Others-Sorted.csv")

# order results by padj value (most significant to least)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
rld <- rlogTransformation(dds, blind=T)
vsd <- varianceStabilizingTransformation(dds, blind=T)

ddsClean <- replaceOutliersWithTrimmedMean(dds)
ddsClean <- DESeq(ddsClean)
resClean <- results(ddsClean)
resClean = subset(res, padj<0.05)
resClean <- resClean[order(resClean$padj),]
select <- order(rowMeans(counts(ddsClean,normalized=T)),decreasing=T)[1:1000]
my_palette <- colorRampPalette(c("blue",'white','red'))(n=1000)
heatmap.2(assay(vsd)[select,], col=my_palette,
          scale="row", key=F, keysize=1, symkey=T,
          density.info="none", trace="none",
          cexCol=0.6, labRow=F,
          main="1000 Top Expressed Genes Heatmap")


#####
sampleDists <- dist( t( assay(rld) ) )
sampleDists
sampleDistMatrix <- as.matrix( sampleDists )
rownames(sampleDistMatrix) <- paste( rld$treatment, rld$Tissue )
colnames(sampleDistMatrix) <- NULL
colours = colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
heatmap.2( sampleDistMatrix, trace="none", key=F, col=colours)
