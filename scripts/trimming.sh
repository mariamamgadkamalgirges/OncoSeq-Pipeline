#!/bin/bash

echo "======================================"
echo "OncoSeq Pipeline - Read Trimming"
echo "======================================"

mkdir -p data/trimmed

fastp \
-i data/raw/sample_R1.fastq.gz \
-I data/raw/sample_R2.fastq.gz \
-o data/trimmed/sample_R1.trimmed.fastq.gz \
-O data/trimmed/sample_R2.trimmed.fastq.gz

echo "Read Trimming Completed."
