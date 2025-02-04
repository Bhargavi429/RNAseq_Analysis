
#DEG with DEseq2:
#gene_counts.txt file from featureCounts needs to be reformatted for use with DESeq2 in R.
# Load necessary libraries
library(data.table)

# Read the raw count data
counts <- fread("gene_counts.txt", skip = 1)  # Skip featureCounts header

# Retain only relevant columns (Geneid and count columns)
counts <- counts[, c(1, 7:ncol(counts)), with = FALSE]

# Rename the columns for simplicity
colnames(counts) <- c("Geneid", "Control_1", "Control_2", "Treated_1", "Treated_2")

# Save the cleaned file
fwrite(counts, "cleaned_gene_counts.txt", sep = "\t", quote = FALSE, row.names = FALSE)

# Check output
head(counts)
write.csv(counts, file = "E:/RNAseq_Project/data/counts.csv", row.names = FALSE)

#if you have too many zeros then:
# Remove genes with all zero counts across all samples
counts_filtered <- counts[rowSums(counts[, -1, with = FALSE]) > 0]

# Save the filtered file
fwrite(counts_filtered, "filtered_gene_counts.txt", sep = "\t", quote = FALSE, row.names = FALSE)

# Check output
head(counts_filtered)

#Load required libraries
library(DESeq2)

#Read the cleaned count data
counts_filtered <- read.table("filtered_gene_counts.txt", header = TRUE, row.names = 1, sep = "\t")
write.csv(counts_filtered, file = "E:/RNAseq_Project/data/counts_filtered.csv", row.names = FALSE)

#Create metadata (sample information)
coldata <- data.frame(
  row.names = colnames(counts_filtered),
  condition = c("Control", "Control", "Treated", "Treated") # Modify according to your experiment
)
write.csv(coldata, file = "E:/RNAseq_Project/data/coldata.csv", row.names = FALSE)

# Ensure condition is a factor
coldata$condition <- factor(coldata$condition, levels = c("Control", "Treated"))

#Create DESeq2 dataset
dds <- DESeqDataSetFromMatrix(
  countData = counts_filtered,
  colData = coldata,
  design = ~ condition
)

# Extract the count matrix from the DESeqDataSet
count_matrix <- assay(dds)

# Write the count matrix to a CSV file
write.csv(count_matrix, file = "E:/RNAseq_Project/data/dds_counts.csv", row.names = TRUE)

#Run DESeq2 analysis
dds <- DESeq(dds)
res <- results(dds)

#Save results
write.csv(as.data.frame(res), file = "DESeq2_results.csv")

