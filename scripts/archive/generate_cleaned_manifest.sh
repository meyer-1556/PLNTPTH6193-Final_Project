#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --time=01:00:00
#SBATCH --output=slurm-manifest-%j.out
set -euo pipefail

# Define the base directory for the project
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject"

# Define the path to the cleaned fastq files
CLEANED_FASTQ_DIR="${BASE_DIR}/raw_data/cleaned_fastq"

# Path for the manifest file
MANIFEST="${BASE_DIR}/raw_data/cleaned_fastq/manifest.csv"

# Create or clear the manifest file with header
echo "sample-id,absolute-filepath,direction" > $MANIFEST

# Check if the cleaned fastq directory exists
if [ ! -d "$CLEANED_FASTQ_DIR" ]; then
    echo "Cleaned fastq directory not found!"
    exit 1
fi

# Navigate to the directory containing cleaned sequences
cd $CLEANED_FASTQ_DIR

# Loop through the fastq files, specifically targeting only *_cleaned.fastq files
for file in *_cleaned.fastq; do
    # Extract the sample ID from the file name
    sample_id=$(basename "$file" _cleaned.fastq)

    # Write to the manifest file
    echo "$sample_id,$PWD/$file,forward" >> $MANIFEST
done

# Debugging output to check the contents of the manifest file
echo "Contents of the manifest file:"
cat $MANIFEST
