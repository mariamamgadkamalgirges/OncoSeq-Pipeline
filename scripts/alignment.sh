#!/bin/bash

echo "======================================"
echo "OncoSeq Pipeline - Read Alignment"
echo "======================================"

mkdir -p results/alignment

bwa mem \
reference/hg38.fa \
data/trimmed/sample_R1.trimmed.fastq.gz \
data/trimmed/sample_R2.trimmed.fastq.gz \
> results/alignment/sample.sam

samtools view -Sb results/alignment/sample.sam \
> results/alignment/sample.bam

samtools sort \
results/alignment/sample.bam \
-o results/alignment/sample.sorted.bam

samtools index \
results/alignment/sample.sorted.bam

echo "Alignment Completed."
