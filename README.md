# Final Project: Assessing the Impact of Harmane Treatment on Horse Dung Microbiomes

## Project Overview

This project aims to explore the effects of harmane, a compound found in the mycelium of psilocybin-producing fungi, on the microbial communities in horse dung. Utilizing 16S rRNA metabarcoding, this study compares the microbiomes of harmane-treated versus untreated samples across three time points to discern the compound's impact on microbial diversity and composition.

## Data

### Dataset Description

The dataset comprises demultiplexed `.fastq` files from an Oxford Nanopore MinION 16S barcoding sequencing run using the 16S Barcoding Kit 1-24 (SQK-16S024), totaling 24 samples across four categories:

- **Harmane-Treated Horse Dung**:
  - 9 samples across three collection days.
  - Days 0, 4, 14: Barcodes 1-3, 4-6, 7-9 respectively (biological replicates).
- **Non-Harmane-Treated Horse Dung**:
  - 9 control samples collected parallel to the treated group.
  - Days 0, 4, 14: Barcodes 10-12, 13-15, 16-18 respectively (biological replicates).
- **Negative Control**:
  - 3 samples (barcodes 19-21, technical replicates) to check for contamination and sequencing biases.
- **Positive Control**:
  - 3 samples (barcodes 22-24, technical replicates) of a known artificial microbiome to verify sequencing and analytical accuracy.

Each sample file is stored in its respective directory labeled by barcode within the `Demultiplexed` directory, such as `barcode01`, `barcode02`, etc.

### Pre-processing

The raw sequencing data underwent several pre-processing steps:

1. **Basecalling**: Sequencing data was initially basecalled using Guppy, the software provided by Oxford Nanopore Technologies.
2. **Demultiplexing**: The basecalled reads were then demultiplexed using Guppy barcoder to assign reads to their respective barcode based on the 16S Barcoding Kit used during sample preparation.
3. **File Organization**: Post-demultiplexing, the reads were organized into respective folders for each barcode. These folders contain multiple `.fastq` files, representing sequencing runs.

The raw data is extensive and therefore not included in this repository due to size constraints but is located at `/fs/ess/PAS2700/users/meyer1556/Final_Project/raw_data/Demultiplexed` on the Ohio Supercomputer Center (OSC) storage systems.

## Project Execution and Troubleshooting

### Current Status

The project is currently incomplete due to unresolved technical issues primarily involving dependencies and configurations within the QIIME2 environment. Specific problems include errors during the `importDb` process where QIIME2 fails to import necessary data due to caching issues in the `numba` and `umap` Python modules.

### Steps for Running the Project

To attempt running the project:

1. **Data Preparation**: Copy the raw data from the provided OSC path into your directory.
2. **Environment Setup**: Configure the necessary computational environments and dependencies as detailed in the submission notes and the main script.
3. **Pipeline Execution**: Run the provided pipeline script, keeping in mind that due to unresolved issues, successful completion is not guaranteed.

### Additional Notes

- **Archive and Temporary Files**: Please disregard files in any `archive` subdirectories and any temporary files generated during troubleshooting unless required for detailed error analysis.
- **Dependency and Configuration Issues**: Numerous adjustments to environment variables and directory permissions were required, which are detailed in the submission notes. These reflect the project's ongoing troubleshooting efforts.

## Final Remarks

Despite the challenges faced, this project offers a valuable learning opportunity in the complexities of bioinformatics workflows. Future efforts to resolve the current issues will be crucial for its completion. Your understanding and patience are appreciated.

Thank you for reviewing this project.
