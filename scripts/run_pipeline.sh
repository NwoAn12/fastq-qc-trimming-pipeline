#!/bin/bash

INPUT=$1

mkdir -p results/fastqc_reports

echo "Running FastQC..."
fastqc "$INPUT" -o results/fastqc_reports

echo "Trimming with Cutadapt..."
cutadapt -q 20 -m 30 -o results/trimmed_reads.fastq.gz "$INPUT"

echo "Post-trim QC..."
fastqc results/trimmed_reads.fastq.gz -o results/fastqc_reports

echo "Done."

