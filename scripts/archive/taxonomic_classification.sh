#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --cpus-per-task=16
#SBATCH --time=04:00:00
#SBATCH --output=slurm-kraken2-%j.out
set -euo pipefail

# Load necessary modules
module load miniconda3/23.3.1-py310
conda activate kraken2_env

# Define directories
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject"
CLEANED_FASTQ_DIR="$BASE_DIR/raw_data/cleaned_fastq"
RESULTS_DIR="$BASE_DIR/results/taxonomy"
mkdir -p $RESULTS_DIR

# Path to Kraken2 database
DB_PATH="$BASE_DIR/programs/kraken2_db/16S_kraken_db"

# Process each cleaned FASTQ file with Kraken2
for fastq_file in $CLEANED_FASTQ_DIR/*_cleaned.fastq; do
    # Extract the sample ID from the filename
    sample_id=$(basename "$fastq_file" "_cleaned.fastq")

    # Run Kraken2
    kraken2 --db $DB_PATH --threads 16 --output $RESULTS_DIR/${sample_id}_kraken2.out --report $RESULTS_DIR/${sample_id}_kraken2.report $fastq_file

done

echo "Kraken2 classification completed for all samples."