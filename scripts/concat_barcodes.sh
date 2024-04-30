#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --cpus-per-task=16
#SBATCH --time=04:00:00
#SBATCH --output=slurm-concat_barcodes-%j.out
set -euo pipefail

# Define the base directory for the project
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject"

# Define the path to the demultiplexed data
DEMUX_DIR="${BASE_DIR}/raw_data/Demultiplexed"

# Define the output directory for concatenated files
CONCAT_DIR="${BASE_DIR}/raw_data/concatenated_fastq"
mkdir -p $CONCAT_DIR

# Check if the demultiplexed directory exists
if [ ! -d "$DEMUX_DIR" ]; then
    echo "Demultiplexed directory not found!"
    exit 1
fi

# Navigate to the directory containing demultiplexed sequences
cd $DEMUX_DIR

# Loop through the barcode directories
for dir in barcode*; do
    # Concatenate all fastq files in the directory
    cat $dir/*.fastq > "${CONCAT_DIR}/${dir}.fastq"
    echo "Concatenated files for $dir"
done

echo "All files have been concatenated and are located in $CONCAT_DIR"
