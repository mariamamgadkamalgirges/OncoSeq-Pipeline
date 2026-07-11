#!/bin/bash

echo "======================================"
echo "OncoSeq Pipeline - Quality Control"
echo "======================================"

mkdir -p results/fastqc

fastqc data/raw/*.fastq.gz \
-o results/fastqc

echo "Quality Control Completed."
