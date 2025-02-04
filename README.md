**RNA-Seq Analysis of Tumor-Free vs Tumor-Bearing Drosophila melanogaster Larvae**

**Project Overview:**
This project involves RNA-Seq analysis comparing the gene expression of tumor-free (w1118) and tumor-bearing (MARCM RasV12, scrib1) Drosophila melanogaster larvae. The goal is to identify differentially expressed genes (DEGs) between the two conditions, providing insights into the genetic alterations associated with tumor development in this model organism.
Organism: Drosophila melanogaster
Conditions:
Control (tumor-free): w1118
Treated (tumor-bearing): MARCM RasV12, scrib1
The analysis includes several steps from raw data acquisition, quality control, read alignment, differential expression analysis, and visualization of the results.

**Project Workflow:**
Data Acquisition:
The data was downloaded from the NCBI Sequence Read Archive (SRA) and consists of paired-end RNA-Seq reads from four different samples:
a)Control 1 (Control1_1.fastq, Control1_2.fastq)
b)Control 2 (Control2_1.fastq, Control2_2.fastq)
c)Treated 1 (Treated1_1.fastq, Treated1_2.fastq)
d)Treated 2 (Treated2_1.fastq, Treated2_2.fastq)

Quality Control & Preprocessing:
a)FASTQC: Used to check the quality of raw RNA-Seq reads.
b)Trimming: Applied using fastp to remove adapters and low-quality bases.
c)Re-QC: Checked the quality of trimmed reads again using FASTQC.

Read Alignment:
Reads were aligned to the Drosophila melanogaster genome using two different alignment tools:
a)HISAT2: For initial mapping and generating sorted BAM files.
b)STAR: For more refined alignment and to generate gene expression counts.

Differential Expression Analysis:
a)featureCounts: Used to count the number of reads aligned to genes.
b)DESeq2: Performed differential gene expression analysis to identify DEGs between control and treated groups.

Visualization:
a)MA Plot: Visualized log-fold changes in gene expression.
b)Volcano Plot: Plotted significance against fold change for DEGs.
c)PCA Plot: Used to visualize the variance across samples.
d)Heatmap: Displayed the expression of top DEGs using rlog or VST normalization.

Files in the Repository:
a)/scripts: Contains all shell and R scripts used in the analysis.
01_download_data.sh: Downloads the RNA-Seq FASTQ files.
02_quality_control.sh: Performs FASTQC and trimming.
03_mapping_hisat2.sh: Aligns reads using HISAT2.
04_mapping_star.sh: Aligns reads using STAR.
05_featurecounts.sh: Generates gene count files.
06_deseq2_analysis.R: Performs differential expression analysis with DESeq2.
07_visualization.R: Creates visualizations like MA plot, Volcano plot, PCA, and Heatmap.

b)/data: Contains the raw and processed data (e.g., trimmed reads, alignment files, count data).

c)/results: Stores all output files such as alignment reports, DEG results, and other intermediate files.

d)/figures: Contains plots like the MA plot, Volcano plot, PCA plot, and Heatmap.

**How to Run the Analysis:**
Prerequisites:
a)FASTQC – for quality control.
b)fastp – for trimming the reads.
c)HISAT2 – for read alignment or STAR – for read alignment.
d)Samtools – for working with BAM files.
e)Cufflinks – for gene expression quantification and differential expression analysis.
f)featureCounts – for counting reads aligned to genes.
g)R – for DESeq2 analysis and plotting.
h)R packages:
install.packages("data.table")
install.packages("ggplot2")
BiocManager::install("DESeq2")
BiocManager::install("pheatmap")

**Results:**
The final differential expression results will be stored in the DESeq2_results.csv file. Visualizations such as MA plots, volcano plots, and PCA will be saved in the figures/ directory.

**References:**
Drosophila melanogaster genome: dm6 (UCSC Genome Browser)
FASTQC: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
HISAT2: https://daehwankimlab.github.io/hisat2/
STAR: https://github.com/alexdobin/STAR
DESeq2: https://bioconductor.org/packages/release/bioc/html/DESeq2.html
