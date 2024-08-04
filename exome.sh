#!/bin/bash

# Start
start=$SECONDS

# Fetch the sample data from the SRA database
echo "Downloading sample data from SRA..."
prefetch SRR098344
fasterq-dump — threads 2 — progress SRR098344   

# Input FASTQ files
READ1="SRR098344_1.fastq"
READ2="SRR098344_2.fastq"

# Paths to reference files and tools
REFERENCE="/home/NGS/tools/hg38/hg38"
REFERENCE_FA="/home/NGS/tools/hg38/hg38.fa"

# Align reads to the reference genome using Bowtie2
echo "Starting alignment with Bowtie2..."
bowtie2 -x $REFERENCE -1 $READ1 -2 $READ2 -S output.sam
echo "Bowtie2 alignment completed."

# Convert SAM to BAM, sort, and index using Samtools
echo "Converting SAM to BAM, sorting, and indexing..."
samtools view -bS output.sam > output.bam
samtools sort output.bam -o output.sorted.bam
samtools index output.sorted.bam
echo "SAM to BAM conversion, sorting, and indexing completed."

# Generate mpileup file using Samtools
echo "Generating mpileup file..."
samtools mpileup -B -q 1 -f $REFERENCE_FA output.sorted.bam > output.mpileup.bam
echo "Mpileup file created."

# Call variants using Varscan
echo "Calling variants using Varscan..."
varscan mpileup2snp output.mpileup.bam --output-vcf 1 > output.varscan.snp.vcf
echo "Variants called using Varscan."

# Call variants using BCFtools
echo "Calling variants using BCFtools..."
bcftools mpileup -f $REFERENCE_FA output.sorted.bam | bcftools call -mv -Ov -o output.bcftools.vcf
echo "Variants called using BCFtools."

# Call variants using FreeBayes
echo "Calling variants using FreeBayes..."
freebayes -f $REFERENCE_FA output.sorted.bam > output.freebayes.vcf
echo "Variants called using FreeBayes."

# Additional processing using AWK (example for filtering variants)
echo "Filtering variants with AWK..."
awk '$6 >= 20' output.varscan.snp.vcf > filtered.varscan.snp.vcf
echo "Variants filtered with AWK."

# Annotate variants using ClinVar (assuming clinvar.vcf is present)
echo "Annotating variants using ClinVar..."
bcftools annotate -a clinvar.vcf -c ID,INFO -o annotated.varscan.vcf filtered.varscan.snp.vcf
echo "Variants annotated using ClinVar."

# Print the total elapsed time
elapsed=$((SECONDS - start))
echo "Whole Exome Sequencing analysis completed in $elapsed seconds."
