
#Mapping reads using STAR:
A. Indexing the genome
#Before aligning the reads, you need to generate the genome index.
mkdir star_index
STAR --runThreadN 4 --runMode genomeGenerate --genomeDir star_index \
     --genomeFastaFiles dm6.fa --sjdbGTFfile dm6.gtf --sjdbOverhang 100 \
     --genomeSAindexNbases 10

#B. Mapping reads to the indexed genome Using STAR
mkdir -p star_output

STAR --runThreadN 4 --genomeDir star_index \
     --readFilesIn control1_1.fastq control1_2.fastq \
     --outFileNamePrefix star_output/control1_ \
     --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 4 --genomeDir star_index \
     --readFilesIn control2_1.fastq control2_2.fastq \
     --outFileNamePrefix star_output/control2_ \
     --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 4 --genomeDir star_index \
     --readFilesIn Treated1_1.fastq Treated1_2.fastq \
     --outFileNamePrefix star_output/treated1_ \
     --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 4 --genomeDir star_index \
     --readFilesIn Treated2_1.fastq Treated2_2.fastq \
     --outFileNamePrefix star_output/treated2_ \
     --outSAMtype BAM SortedByCoordinate


#Output of Logs
cat star_output/control1_Log.out
less star_output/treated1_Log.out

#aligned output is stored in BAM files
samtools flagstat star_output/control1_Aligned.sortedByCoord.out.bam

