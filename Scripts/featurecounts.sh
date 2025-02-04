
#Gene Quantification using featureCounts 
featureCounts -a dm6.gtf -o gene_counts.txt -t exon -g gene_id star_output/*.bam
