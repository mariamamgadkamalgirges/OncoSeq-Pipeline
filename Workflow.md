# OncoSeq Pipeline Workflow

## End-to-End Bioinformatics Workflow
Patient Sample
        │
        ▼
FASTQ Files
        │
        ▼
Quality Control (FastQC)
        │
        ▼
Read Trimming (Fastp)
        │
        ▼
Alignment (BWA-MEM)
        │
        ▼
SAM/BAM Processing (SAMtools)
        │
        ▼
Variant Calling (GATK Mutect2)
        │
        ▼
Variant Annotation (VEP)
        │
        ▼
Clinical Interpretation
        │
        ▼
Final Clinical Report

## Pipeline Objective

The OncoSeq Pipeline automates the complete bioinformatics workflow for cancer next-generation sequencing (NGS) analysis, from raw sequencing reads to clinically interpretable genomic variants and precision oncology reports.
