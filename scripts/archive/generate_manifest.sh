#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --time=01:00:00
#SBATCH --output=slurm-manifest-%j.out
set -euo pipefail

# Define the base directory for the project
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject"

# Define the path to the concatenated fastq files
CONCAT_DIR="${BASE_DIR}/raw_data/concatenated_fastq"

# Path for the manifest file
MANIFEST="${BASE_DIR}/raw_data/concatenated_fastq/manifest.csv"

# Create or clear the manifest file with header
echo "sample-id,absolute-filepath,direction" > $MANIFEST

# Check if the concatenated directory exists
if [ ! -d "$CONCAT_DIR" ]; then
    echo "Concatenated fastq directory not found!"
    exit 1
fi

# Navigate to the directory containing concatenated sequences
cd $CONCAT_DIR

# Loop through the fastq files
for file in *.fastq; do
    # Exclude files in the logs directory
    if [ "$file" != "logs/*" ]; then
        # Extract the sample ID from the file name
        sample_id=$(basename "$file" .fastq)

        # Write to the manifest file
        echo "$sample_id,$PWD/$file,forward" >> $MANIFEST
    fi
done

# Debugging output to check the contents of the manifest file
echo "Contents of the manifest file:"
cat $MANIFEST
