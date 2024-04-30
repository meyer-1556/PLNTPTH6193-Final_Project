#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --time=06:00:00
#SBATCH --output=slurm-cleantrim-%j.out
set -euo pipefail

# Base directory for project
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject"

# Directory containing raw concatenated FASTQ files
FASTQ_DIR="$BASE_DIR/raw_data/concatenated_fastq"

# Output directory for processed FASTQ files
CLEANED_FASTQ_DIR="$BASE_DIR/raw_data/cleaned_fastq"
mkdir -p $CLEANED_FASTQ_DIR

# Load software
module load miniconda3/23.3.1-py310
conda activate bioenv

# Process each FASTQ file
for fastq_file in $FASTQ_DIR/*.fastq; do
    if [ -f "$fastq_file" ]; then
        barcode=$(basename $fastq_file .fastq)

        # Step 1: Adapter trimming with Porechop
        trimmed_fastq="$CLEANED_FASTQ_DIR/${barcode}_trimmed.fastq"
        porechop -i $fastq_file -o $trimmed_fastq

        # Step 2: Quality filtering with NanoFilt
        cleaned_fastq="$CLEANED_FASTQ_DIR/${barcode}_cleaned.fastq"
        cat $trimmed_fastq | NanoFilt -q 7 -l 500 > $cleaned_fastq

        echo "Processed $fastq_file"
    else
        echo "File not found: $fastq_file"
    fi
done

echo "Preprocessing complete. Cleaned files are located in $CLEANED_FASTQ_DIR"