

#Basic Visualization
*****# MA plot(visualizes the relationship between the mean expression level and the log fold change of genes.X-axis: Mean of normalized counts (expression level).Y-axis: Log2 fold change (differential expression).)*****
plotMA(res, main = "DESeq2 MA Plot", ylim = c(-5, 5))

*****# Volcano plot(helps visualize the significance and magnitude of differential expression.X-axis: Log2 fold change (effect size).Y-axis: -Log10 adjusted p-value (significance).)*****
library(ggplot2)
## Convert DESeq2 results to a data frame
res_df <- as.data.frame(res)
res_df$Gene <- rownames(res_df)
write.csv(res_df, file = "E:/RNAseq_Project/data/res_df.csv", row.names = FALSE)

## Volcano Plot
ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  xlab("Log2 Fold Change") +
  ylab("-Log10 Adjusted P-value") +
  ggtitle("Volcano Plot of Differential Expression")

*****#PCA Plot (Principal Component Analysis) helps visualize the variance*****
# VST (Variance Stabilizing Transformation)
vsd <- vst(dds, blind = FALSE)
# Extract the transformed data (log-transformed counts from vsd)
vsd_matrix <- assay(vsd)

# Write the matrix to a CSV file
write.csv(vsd_matrix, file = "E:/RNAseq_Project/data/vsd.csv", row.names = TRUE)


# Calculate the variance for each gene
variances <- apply(assay(vsd), 1, var)
write.csv(variances, file = "E:/RNAseq_Project/data/variances.csv", row.names = TRUE)


# Select the top 500 most variable genes
top_genes <- order(variances, decreasing = TRUE)[1:500]
write.csv(top_genes, file = "E:/RNAseq_Project/data/top_genes.csv", row.names = TRUE)


# Subset the VST-transformed data to keep only the top 500 most variable genes
vsd_top500 <- vsd[top_genes, ]
# Extract the matrix from the vsd_top500 object
vsd_top500_matrix <- assay(vsd_top500)

# Write the matrix to a CSV file
write.csv(vsd_top500_matrix, file = "E:/RNAseq_Project/data/vsd_top500.csv", row.names = TRUE)


# Plot PCA for the top 500 most variable genes
plotPCA(vsd_top500, intgroup = "condition")

*****#Heatmap of DESeq2 Normalized Counts (helps to visualize gene expression patterns)*****
# Select top 50 differentially expressed genes
top_genes <- head(order(res$padj), 50)  # Change 50 to your desired number of top genes

# Get rlog or VST transformed counts
rlog_counts <- rlog(dds, blind = FALSE)  # Or use vst(dds)
# Extract the rlog-transformed count matrix
rlog_matrix <- assay(rlog_counts)

# Write the matrix to a CSV file
write.csv(rlog_matrix, file = "E:/RNAseq_Project/data/rlog_counts.csv", row.names = TRUE)


# Extract the counts for the top genes
top_counts <- assay(rlog_counts)[top_genes,]
write.csv(top_counts, file = "E:/RNAseq_Project/data/top_counts.csv", row.names = TRUE)


# Create heatmap
library(pheatmap)
pheatmap(top_counts, scale = "row", 
         clustering_distance_rows = "euclidean", 
         clustering_distance_cols = "euclidean", 
         annotation_col = coldata)  # Adds condition annotations

