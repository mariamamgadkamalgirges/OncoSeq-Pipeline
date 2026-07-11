#!/bin/bash

set -euo pipefail

echo "======================================"
echo "Starting OncoSeq Pipeline"
echo "======================================"

bash scripts/quality_control.sh

bash scripts/trimming.sh

bash scripts/alignment.sh

bash scripts/variant_calling.sh

bash scripts/annotation.sh

python3 scripts/report_generation.py

echo "======================================"
echo "OncoSeq Pipeline Completed Successfully"
echo "======================================"
