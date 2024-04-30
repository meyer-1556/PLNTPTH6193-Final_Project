#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --cpus-per-task=16
#SBATCH --time=04:00:00
#SBATCH --output=slurm-run_metontiime-%j.out
set -euo pipefail

# Define the base directory for the project
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/Final_Project"

# Define the path to the configuration file
CONFIG="${BASE_DIR}/programs/MetONTIIME/metontiime2.conf"

# Define the path to the .nf file
NF="${BASE_DIR}/programs/MetONTIIME/metontiime2.nf"

# Define the path to the concatenated fastq directory
FASTQ="${BASE_DIR}/raw_data/concatenated_fastq_gz"

# Define the path to the results directory
RESULTS="${BASE_DIR}/results"

# Activate Conda, Singularity, Java, and Nextflow environments
module load miniconda3/23.3.1-py310
module load singularity/centos7
module load java
conda activate qiime2-amplicon-2024.2
conda activate nextflow_env
conda activate numba

# Run MetONTIIME
nextflow -c $CONFIG run $NF --workDir="$FASTQ" --resultsDir="$RESULTS" -profile singularity -resume

# Move the Nextflow log file after the run
mv .nextflow.log ${RESULTS}/logs/.nextflow.log-${SLURM_JOB_ID}