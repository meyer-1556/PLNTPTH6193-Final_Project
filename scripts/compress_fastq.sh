#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --cpus-per-task=16
#SBATCH --time=04:00:00
#SBATCH --output=slurm-run_metontiime-%j.out
set -euo pipefail


# Define the source and target directories
SOURCE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject/raw_data/concatenated_fastq"
TARGET_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject/raw_data/concatenated_fastq_gz"

# Create the target directory if it doesn't already exist
mkdir -p "$TARGET_DIR"

# Loop through all .fastq files in the source directory and compress them into the target directory
for file in "$SOURCE_DIR"/*.fastq; do
    # Check if the file exists to prevent errors in case of no .fastq files
    if [ -f "$file" ]; then
        gzip -c "$file" > "$TARGET_DIR/$(basename "$file" .fastq).fastq.gz"
    fi
done

echo "Compression complete. Compressed files are in $TARGET_DIR"
