#!/bin/bash

echo "======================================"
echo "OncoSeq Pipeline - Variant Calling"
echo "======================================"

mkdir -p results/variants

gatk Mutect2 \
-R reference/hg38.fa \
-I results/alignment/sample.sorted.bam \
-O results/variants/sample.vcf

echo "Variant Calling Completed."
