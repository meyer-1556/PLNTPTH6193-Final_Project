# **Final Project Proposal: Assessing the Impact of Harmane Treatment on Horse Dung Microbiomes**


## **Project Overview**

This project seeks to uncover the effects of harmane, a compound found in the mycelium of psilocybin-producing fungi, on the bacterial and archaeal communities within horse dung. Using 16S rRNA metabarcoding, I will compare the microbiomes of harmane-treated and untreated horse dung samples collected at different time points (days 0, 4, and 14). This analysis aims to identify changes in microbial diversity and composition attributable to harmane exposure, offering insights into its ecological and microbial regulatory roles.

### **Data**

The dataset consists of demultiplexed ```.fastq``` files from an Illumina MinION sequencing run, comprising 24 samples divided into four categories:

-   **Harmane-Treated Horse Dung**: 9 samples collected over three time points (barcodes 1-9).
    - Day 0: Barcodes 1-3, biological replicates
    - Day 4: Barcodes 4-6, biological replicates
    - Day 14: Barcodes 7-9, biological replicates
-   **Non-Harmane-Treated Horse Dung**: 9 samples serving as controls, collected simultaneously with the treated samples (barcodes 10-18).
    - Day 0: Barcodes 10-12, biological replicates
    - Day 4: Barcodes 13-15, biological replicates
    - Day 14: Barcodes 16-18, biological replicates
-   **Negative Control**: 3 samples to account for potential contamination and sequencing biases (barcodes 19-21, technical replicates).
-   **Positive Control**: 3 samples of an artificial microbiome community to ensure sequencing and analysis accuracy (barcodes 22-24, technical replicates).

The ```.fastq``` files for each barcode are found in their titular directories (e.g., ```barcode01```) within the ```Demultiplexed``` directory, with the titles ```fastq_runid*.fastq```. Each group includes triplicate samples for robust statistical analysis.

### **Expected Output**

The project will produce a comprehensive report detailing:

1.  Perform quality control analysis on the raw data
2.  Taxonomic composition of microbiomes in treated versus untreated samples.
3.  Changes in microbial diversity and abundance in response to harmane treatment.
4.  Identification of specific taxa influenced by harmane treatment.


## **Technical Approach**

### **Code and Tools**

The analysis pipeline will be constructed using Bash scripting, focusing on command-line tools within QIIME 2. This ensures a seamless workflow within a Unix Shell environment.

-   **Quality Control**: Utilize QIIME 2's ```qiime tools import``` and ```qiime demux``` commands to visualize and assess the quality of sequencing reads in the ```allreads.fastq``` file.
-   **Taxonomic Analysis**: Apply ```qiime feature-classifier``` to assign taxonomy to the sequences based on a pre-trained classifier and reference database (e.g., SILVA or Greengenes).
-   **Diversity Analysis**: Perform alpha and beta diversity analyses using ```qiime diversity``` commands, comparing microbial diversity within and between sample groups (treated vs. untreated).
-   **Differential Abundance Testing**: Conduct differential abundance analysis with ```qiime feature-table``` and ```qiime taxa``` commands to identify taxa that are significantly affected by harmane treatment.

### **Data Organization**

The workflow will generate directories for each major step (e.g., ```qc```, ```taxonomy```, ```diversity_analysis```), containing visualizations and statistical outputs that facilitate the interpretation of results.

### **Challenges & Uncertainties**

-   **Computational Resources**: Given the large size of the ```allreads.fastq``` file (3.2GB), processing time and memory requirements could pose challenges.
-   **Taxonomic Resolution**: The effectiveness of taxonomic classification may be limited by the reference database's comprehensiveness and the inherent resolution limits of 16S rRNA sequencing.

## **Rationale**

Selecting this project allows me to apply bioinformatics tools to a real-world research question pertinent to my field. Focusing on Bash and QIIME 2 leverages the power of command-line tools for microbiome analysis, enhancing my skills in data processing and analysis within a Unix environment. This project directly contributes to understanding the ecological impact of harmane on microbial communities, offering insights into microbial dynamics in environmental samples.
