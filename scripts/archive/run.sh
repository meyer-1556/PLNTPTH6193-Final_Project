## Step 1: Prepare the data

# Navigate to Final Project directory
cd FinalProject

# Concatenate all .fastq reads into one file per barcode
sbatch scripts/concat_barcodes.sh


## Step 2: Trim and filter the data

# Activate Conda environment
module load miniconda3/23.3.1-py310

# Download Porechop and Nanofilt (if not already installed)
conda create -n bioenv python=3.10
conda activate bioenv
conda install -c bioconda porechop
conda install -c bioconda nanofilt

# Trim and filter data
sbatch scripts/preprocess_nanopore_data.sh

# Create the Manifest file
sbatch scripts/generate_cleaned_manifest.sh

## Step 3: Classify taxonomy

# Install and activate Kraken2
conda deactivate
conda create -n kraken2_env
conda activate kraken2_env
conda install -y -c bioconda kraken2

# Download and build Kraken2 database
sbatch scripts/build_kraken2_db.sh

# Run Kraken2 taxonomic classification
sbatch scripts/taxonomic_classification.sh


## Step 3: Import the data to QIIME 2

# Install QIIME 2 (if not already installed)
wget https://data.qiime2.org/distro/amplicon/qiime2-amplicon-2024.2-py38-linux-conda.yml
conda env create -n qiime2-amplicon-2024.2 --file qiime2-amplicon-2024.2-py38-linux-conda.yml

# Activate the QIIME 2 Environment
conda activate qiime2-amplicon-2024.2

# Run the Import command
qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-path raw_data/cleaned_fastq/manifest.csv \
  --output-path results/qc/demux.qza \
  --input-format SingleEndFastqManifestPhred33


## Step 3: Visualize Sequence Quality & Trim

# Generate a quality plot
qiime demux summarize \
  --i-data results/qc/demux.qza \
  --o-visualization results/qc/demux.qzv
  # View the demux.qzv file using QIIME 2 View (https://view.qiime2.org). This step will help you decide on if the data needs more trimming and the parameters.

# Convert sequences to a dereplicated feature table
qiime vsearch dereplicate-sequences \
  --i-sequences results/qc/demux.qza \
  --o-dereplicated-table results/qc/feature-table.qza \
  --o-dereplicated-sequences results/qc/rep-seqs.qza

# Make a mantifest file
touch results/qc/sample-metadata.tsv
  # This has to be done manually. Create a sample-metadata.csv with the following headers and corresponding information:
  # sample-id,	treatment,	collection-date,	replicate,	control-type
  # sample-id must correspond to the same names as those in the earlier manifest.csv file

# Generate summarize feature tables and sequence data
sbatch scripts/generate_feature_sequence.sh

# Analyze Denoising Statistics
qiime metadata tabulate \
  --m-input-file denoising-stats.qza \
  --o-visualization denoising-stats.qzv
  # View the denoising-stats.qzv file using QIIME 2 View (https://view.qiime2.org). Check to make sure that a reasonable percentage of the input has made it through before proceeding.

