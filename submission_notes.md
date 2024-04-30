# Submission Notes for Final Project

## Project Status and Context

This project utilizes the MetONTIIME pipeline to analyze the impact of harmane treatment on horse dung microbiomes. Unfortunately, the project is currently unfinished due to significant dependency and configuration issues, often referred to as "dependency hell," which could not be resolved within the project timeline.

## Key Challenges and Adjustments

### Configuration and Dependency Issues

1. **Dependency Hell**: The project faced substantial challenges with dependencies, particularly integrating QIIME2 into the MetONTIIME pipeline. Issues with the Python environment, specifically with the `numba` and `umap` modules, led to repeated failures in the `importDb` process, which could not be resolved before the project deadline.

2. **File Formats**: The necessity to convert `.fastq` files into `.fastq.gz` format to meet the pipeline's requirements was a significant step that allowed the pipeline to progress further than initially.

3. **Environment and Permissions**: Adjustments to environment variables and directory permissions were required multiple times to meet the execution requirements of the pipeline.

### Data Management

- **Data Accessibility**: The dataset used for this project is located at `/fs/ess/PAS2700/users/meyer1556/Final_Project/raw_data/Demultiplexed`. This directory contains large `.fastq` files that are not tracked via git due to their size. To rerun the pipeline, these files will need to be copied into your own directory.

### Troubleshooting Steps

- Extensive troubleshooting was attempted, including reinstalling dependencies and adjusting numerous settings within the QIIME2 environment to resolve the caching issues. These efforts were documented in discussions with academic advisors and technical support but did not lead to a resolution.

## Instructions for Attempting to Run the Project

If you choose to attempt running this project, please refer to the steps outlined in the `README.md`. Note that due to the unresolved issues, success is not guaranteed, and similar problems may arise.

## Files to Ignore

- **Archive Directories**: Please ignore any files within `archive` subdirectories, as these contain outdated data and processing attempts.
- **Temporary and Log Files**: Temporary files and detailed log files generated during troubleshooting should be ignored unless needed for in-depth error analysis.

## Final Notes

The project faced unexpected technical challenges that hindered its completion. The troubleshooting process highlighted the complexity of managing dependencies and configurations in bioinformatics workflows, which could be useful insights for future projects.

I appreciate your understanding of these challenges and the incomplete status of the project. Please contact me if you need any additional information or clarification on the attempted processes and configurations.

Thank you for your consideration.
