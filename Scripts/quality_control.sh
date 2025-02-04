
# FASTQC & trimming:

#Quality control
fastqc *.fastq

##Trimming using fastp
touch adapter_c1.fasta adapter_c2.fasta adapter_t1.fasta adapter_t2.fasta

fastp -i Control1_1.fastq -o Trim_Control1_1.fastq -I Control1_2.fastq -O Trim_Control1_2.fastq -w 4 --adapter_fasta adapter_c1.fasta

fastp -i Control2_1.fastq -o Trim_Control2_1.fastq -I Control2_2.fastq -O Trim_Control2_2.fastq -w 4 --adapter_fasta adapter_c2.fasta

fastp -i Treated1_1.fastq -o Trim_Treated1_1.fastq -I Treated1_2.fastq -O Trim_Treated1_2.fastq -w 4 --adapter_fasta adapter_t1.fasta

fastp -i Treated2_1.fastq -o Trim_Treated2_1.fastq -I Treated2_2.fastq -O Trim_Treated2_2.fastq -w 4 --adapter_fasta adapter_t2.fasta


##To perform QC on the generated trimmed fastq files 
mkdir fastqc_results
fastqc Trim_Control1_1.fastq Trim_Control1_2.fastq -o ./fastqc_results/
fastqc Trim_Control2_1.fastq Trim_Control2_2.fastq -o ./fastqc_results/
fastqc Trim_Treated1_1.fastq Trim_Treated1_2.fastq -o ./fastqc_results/
fastqc Trim_Treated2_1.fastq Trim_Treated2_2.fastq -o ./fastqc_results/

