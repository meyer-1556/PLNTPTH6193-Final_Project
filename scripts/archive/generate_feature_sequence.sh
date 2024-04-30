#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --cpus-per-task=16
#SBATCH --time=03:00:00
#SBATCH --output=slurm-feature_sequence-%j.out
set -euo pipefail

# Define the base directory for the project
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject"

# Load software
module load miniconda3/23.3.1-py310
conda activate qiime2-amplicon-2024.2

# Define the input and output directories
QC_DIR="${BASE_DIR}/results/qc"

# Check if the required directories exist
if [ ! -d "$QC_DIR" ]; then
    echo "QC directory not found: $QC_DIR"
    exit 1
fi

# Generate summarize feature tables
echo "Generating summarize feature table visualization..."
qiime feature-table summarize \
  --i-table ${QC_DIR}/feature-table.qza \
  --o-visualization ${QC_DIR}/feature-table-summary.qzv \
  --m-sample-metadata-file ${QC_DIR}/sample-metadata.tsv

# Generate sequence data tabulation
echo "Generating sequence data tabulation visualization..."
qiime feature-table tabulate-seqs \
  --i-data ${QC_DIR}/rep-seqs.qza \
  --o-visualization ${QC_DIR}/rep-seqs.qzv

echo "Process completed successfully."
