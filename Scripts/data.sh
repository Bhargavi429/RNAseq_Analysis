# Downloading FASTQ files and Extracting them:

#control1
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/051/SRR14850651/SRR14850651_1.fastq.gz
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/051/SRR14850651/SRR14850651_2.fastq.gz

#control2
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/063/SRR14850663/SRR14850663_1.fastq.gz
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/063/SRR14850663/SRR14850663_2.fastq.gz

#Treated1
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/097/SRR14850697/SRR14850697_1.fastq.gz
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/097/SRR14850697/SRR14850697_2.fastq.gz

#Treated2
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/098/SRR14850698/SRR14850698_1.fastq.gz
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR148/098/SRR14850698/SRR14850698_2.fastq.gz


#Extract the samples

gunzip *.fastq.gz

