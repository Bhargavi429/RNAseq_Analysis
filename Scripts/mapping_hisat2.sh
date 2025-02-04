
#Mapping of reads to ref genome usinh hisat2:

A. Indexing of genome:
hisat2-build dm6.fa dm6

#B. Mapping of reads to indexed genome:
hisat2 --dta-cufflinks -p 4 -x dm6 -1 Trim_control1_1.fastq -2 Trim_control1_2.fastq > control1.bam
hisat2 --dta-cufflinks -p 4 -x dm6 -1 Trim_control2_1.fastq -2 Trim_control2_2.fastq > control2.bam
hisat2 --dta-cufflinks -p 4 -x dm6 -1 Trim_Treated1_1.fastq -2 Trim_Treated1_2.fastq > treated1.bam
hisat2 --dta-cufflinks -p 4 -x dm6 -1 Trim_Treated2_1.fastq -2 Trim_Treated2_2.fastq > treated2.bam

#Conversion of BAM to sorted BAM:
samtools sort control1.bam > sorted_control1.bam
samtools sort control2.bam > sorted_control2.bam
samtools sort treated1.bam > sorted_treated1.bam
samtools sort treated2.bam > sorted_treated2.bam

#To normalise the data and count the number of reads:
cufflinks -o Cufflinks_c1 -p 4 -G dm6.gtf sorted_control1.bam
cufflinks -o Cufflinks_c2 -p 4 -G dm6.gtf sorted_control2.bam
cufflinks -o Cufflinks_t1 -p 4 -G dm6.gtf sorted_treated1.bam
cufflinks -o Cufflinks_t2 -p 4 -G dm6.gtf sorted_treated2.bam

#Merging of samples:
cuffmerge -o cuffmerge_output -p 4 -g dm6.gtf -s dm6.fa assembly.txt

#Differential gene expression using cuffdiff(Treated vs Control):
cuffdiff -o cuffdiff_output -p 4 -L control,Treated -u /mnt/e/RNAseq_Project/cuffmerge_output/merged.gtf sorted_control1.bam,sorted_control2.bam sorted_treated1.bam,sorted_treated2.bam

