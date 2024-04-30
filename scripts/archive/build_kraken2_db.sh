#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --mail-type=FAIL
#SBATCH --cpus-per-task=16
#SBATCH --time=04:00:00
#SBATCH --output=slurm-build-kraken2_db-%j.out
set -euo pipefail

# Load software
module load miniconda3/23.3.1-py310
conda activate kraken2_env

# Define base directory for Kraken2 database
BASE_DIR="/fs/ess/PAS2700/users/meyer1556/FinalProject/programs/kraken2_db"

# Create directory for Kraken2 database
mkdir -p $BASE_DIR
cd $BASE_DIR

# Download SILVA 16S rRNA database
echo "Downloading SILVA 16S rRNA database..."
wget https://ftp.arb-silva.de/release_138/Exports/SILVA_138_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138_SSURef_NR99_tax_silva.fasta.gz

# Create and build the Kraken2 database
echo "Building Kraken2 database for 16S rRNA sequences..."
kraken2-build --download-taxonomy --db 16S_kraken_db
kraken2-build --add-to-library SILVA_138_SSURef_NR99_tax_silva.fasta --db 16S_kraken_db
kraken2-build --build --db 16S_kraken_db --threads 16

echo "Kraken2 database construction complete."