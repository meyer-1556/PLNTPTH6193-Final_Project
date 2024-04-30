# Assessing the Impact of Harmane Treatment on Horse Dung Microbiomes

This repository contains scripts and documentation for a research project aimed at exploring the effects of harmane, a compound from the mycelium of psilocybin-producing fungi, on the microbial communities in horse dung. By employing 16S rRNA metabarcoding, this study compares the microbiomes of harmane-treated and untreated samples over several time points.

## Repository Contents

- `scripts/`: Contains all the executable scripts needed to run through the analysis pipeline.
    - `run.sh`: A runner script that executes the entire workflow.
    - `concat_barcodes.sh`: A shell script that concatenates all demultiplexed `.fastq` files into one file per barcode.
    - `compress_fastq.sh`: A shell script that compresses all concatenated `.fastq` files into `.fastq.gz` files.
    - `run_metontiime.sh`: A shell script that runs the MetONTIIME2 pipeline.
    - `archive`: A directory of previous scripts when the project was oriented around QIIME2 and Kraken2.
- `raw_data/`: Directory path where input data can be placed.
- `results/`: Output directory where the results of the scripts will be stored.
- `programs/`: Directory where any software-related files and directories will be stored.
- `.gitignore`: A file to prevent the pushing of overly large files to github.
- `proposal.md`: The original proposal for what the project would be.
- `README.md`: Documentation providing an overview of the project, script details, and execution guidance.
- `submission_notes.md`: Contains additional notes for grading and project evaluation.

## Data Description

Data for this project consists of demultiplexed `.fastq` files from an Oxford Nanopore MinION 16S barcoding sequencing run. There are 24 samples organized into four groups:

- Harmane-Treated Horse Dung
- Non-Harmane-Treated Horse Dung
- Negative Control
- Positive Control

Each group includes samples from multiple time points and replicates for comprehensive analysis.

## Scripts and Usage

### Concatenating and Compressing Data

- `concat_barcodes.sh`: Concatenates all `.fastq` reads for each barcode.
- `compress_fastq.sh`: Compresses concatenated `.fastq` files into `.fastq.gz`.

### Running MetONTIIME

- `run_metontiime.sh`: This script sets up the environment, prepares data, and runs the MetONTIIME pipeline on OSC. It handles environment module loading, activating Conda and Nextflow, and executing the MetONTIIME pipeline with appropriate configurations.