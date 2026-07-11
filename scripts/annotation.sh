#!/bin/bash

set -euo pipefail

echo "======================================"
echo "OncoSeq Pipeline - Variant Annotation"
echo "======================================"

INPUT_VCF="results/variants/sample.vcf"
OUTPUT_DIR="results/annotation"
OUTPUT_VCF="${OUTPUT_DIR}/sample.annotated.vcf"

mkdir -p "${OUTPUT_DIR}"

if [[ ! -f "${INPUT_VCF}" ]]; then
    echo "Error: Input VCF not found: ${INPUT_VCF}"
    exit 1
fi

vep \
  --input_file "${INPUT_VCF}" \
  --output_file "${OUTPUT_VCF}" \
  --format vcf \
  --vcf \
  --species homo_sapiens \
  --assembly GRCh38 \
  --cache \
  --offline \
  --symbol \
  --canonical \
  --variant_class \
  --sift b \
  --polyphen b \
  --force_overwrite

echo "Variant Annotation Completed."
echo "Output: ${OUTPUT_VCF}"
