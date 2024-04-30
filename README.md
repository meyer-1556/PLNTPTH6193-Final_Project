# Assessing the Impact of Harmane Treatment on Horse Dung Microbiomes

This repository contains scripts and documentation for a research project aimed at exploring the effects of harmane, a compound from the mycelium of psilocybin-producing fungi, on the microbial communities in horse dung. By employing 16S rRNA metabarcoding, this study compares the microbiomes of harmane-treated and untreated samples over several time points.

## Repository Contents

- `scripts/`: Contains all the executable scripts needed to run the analyses.
- `data/`: Directory path where input data can be placed, expected to be structured as per OSC (Ohio Super Computer) standards.
- `results/`: Output directory where the results of the scripts will be stored.
- `run_metontiime.sh`: A runner script that executes the entire workflow.
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

## Running the Project

To re-run the scripts in this project, navigate to the project directory and execute the runner script:

```bash
cd /path/to/FinalProject
sbatch run_metontiime.sh