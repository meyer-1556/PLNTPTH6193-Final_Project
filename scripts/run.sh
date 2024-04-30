## Step 1: Prepare the data

# Navigate to Final Project directory
cd FinalProject

# Concatenate all .fastq reads into one file per barcode
sbatch scripts/concat_barcodes.sh

# Compress all concatenated .fastq files into .fastq.gz files
sbatch scripts/compress_fastq.sh

# Activate Conda environment
module load miniconda3/23.3.1-py310

# Activate Singularity and Java environments
module load singularity/centos7
module load java

# Install Nextflow (must be installed locally to get the latest version that is needed)
conda create -n nextflow_env
conda activate nextflow_env
conda install nextflow

# Install MetONTIIME (if not already installed)
git clone https://github.com/MaestSi/MetONTIIME.git
cd MetONTIIME

# Download and unzip SILVA database
wget https://www.arb-silva.de/fileadmin/silva_databases/qiime/Silva_132_release.zip
unzip Silva_132_release.zip

# Modify metontiime2.comf file
    # workDir="/fs/ess/PAS2700/users/meyer1556/FinalProject/raw_data/concatenated_fastq_gz"
    # sampleMetadata="/fs/ess/PAS2700/users/meyer1556/FinalProject/raw_data/sample-metadata.tsv"
    # dbSequencesFasta="/fs/ess/PAS2700/users/meyer1556/FinalProject/programs/databases/SILVA_132_QIIME_release/rep_set/rep_set_16S_only/97/silva_132_97_16S.fna"
    # dbTaxonomyTsv="/fs/ess/PAS2700/users/meyer1556/FinalProject/programs/archive/SILVA_138_SSURef_NR99_tax_silva_taxonomy.tsv"
    # executor = 'slurm'
	# Detele the line "queue = 'hugemem'"

# Create nextflow.config file
echo "
process.executor='slurm'
process.clusterOptions='--account=PAS2700'
" > nextflow.config

# Run MetONTIIME
sbatch scripts/run_metontiime.sh

