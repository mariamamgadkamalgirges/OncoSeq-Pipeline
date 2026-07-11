#!/usr/bin/env python3

from pathlib import Path
from datetime import datetime


INPUT_VCF = Path("results/annotation/sample.annotated.vcf")
OUTPUT_DIR = Path("results/report")
OUTPUT_REPORT = OUTPUT_DIR / "sample_report.md"


def read_variants(vcf_path: Path) -> list[str]:
    variants = []

    with vcf_path.open("r", encoding="utf-8") as file:
        for line in file:
            if line.startswith("#"):
                continue

            fields = line.strip().split("\t")

            if len(fields) < 8:
                continue

            chromosome = fields[0]
            position = fields[1]
            variant_id = fields[2]
            reference = fields[3]
            alternative = fields[4]
            quality = fields[5]
            filter_status = fields[6]

            variants.append(
                f"| {chromosome} | {position} | {variant_id} | "
                f"{reference} | {alternative} | {quality} | {filter_status} |"
            )

    return variants


def generate_report() -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    if not INPUT_VCF.exists():
        raise FileNotFoundError(
            f"Annotated VCF file was not found: {INPUT_VCF}"
        )

    variants = read_variants(INPUT_VCF)

    report = f"""# OncoSeq Variant Analysis Report

Generated: {datetime.now().strftime("%Y-%m-%d %H:%M")}

## Analysis Summary

- Input file: {INPUT_VCF}
- Total detected variants: {len(variants)}
- Reference genome: GRCh38
- Annotation tool: Ensembl VEP

## Detected Variants

| Chromosome | Position | Variant ID | Reference | Alternative | Quality | Filter |
|---|---:|---|---|---|---:|---|
"""

    if variants:
        report += "\n".join(variants[:20])
    else:
        report += "\nNo variants were detected."

    report += """

## Important Notice

This report is generated for research and educational demonstration only.

It is not a diagnostic report and must not be used to make clinical treatment decisions without review by qualified healthcare professionals.
"""

    OUTPUT_REPORT.write_text(report, encoding="utf-8")

    print("Report generation completed.")
    print(f"Output: {OUTPUT_REPORT}")


if name == "__main__":
    generate_report()
