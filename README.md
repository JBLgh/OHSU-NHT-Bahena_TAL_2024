# OHSU-NHT-Bahena_TAL_2024
# Explanation of MOUSE Code for TAL Analysis
This document explains the steps performed in the provided R code for analyzing sc-RNAseq data from mouse kidney thick ascending limb (TAL) cells.

## Features
This is a dummy line: <br>
✨ Comprehensive analysis of mouse TAL sc-RNAseq data. <br>
✨ Automated clustering and cell-type annotation. <br>
✨ Publication-ready figures for zonation and DEG analysis. <br>

## How to Use
## Pre-Processing Steps

1. ## Dataset Loading**
```bash
- Download the dataset from [PubMed](https://pubmed.ncbi.nlm.nih.gov/31689386/) and load it using `Seurat::Read10X`. <br>
```
2. ## Object Creation: <br>
```bash
   - Create a Seurat object and perform normalization using `SCTransform`.
```
3. ## Dimensionality Reduction: <br>
```bash
   - Use PCA and UMAP for clustering and visualization.
```
4. ## Clustering:
```
   - Apply `FindNeighbors` and `FindClusters` to group TAL cells.
```
5. ## Subset Clusters:
```
   - Extract specific TAL clusters for further analysis.
```
6. ## Visualization
```
Figures like UMAP plots, violin plots, and dot plots were generated to highlight TAL cell types, DEG, and zonation markers. Scripts for these plots can be found in `scripts/visualization/generate_figures.py`.
```

7. ## Saving Results
```
- Outputs include figures in `.tiff` format and DEG results in `.xlsx`.
```

Refer to the respective script for further details.


## Project Directory Structure:
```
OHSU-NHT-Bahena_TAL_2024/
│
├── README.md                                          # Project documentation
├── LICENSE                                            # Licensing information
│
├── data/                                             # Folder for datasets
│      ├── raw/                                       # Raw datasets (e.g., downloaded files)
│      └── processed/                                 # Processed datasets for analysis
│
├── scripts/                                          # Folder for scripts
│      ├── preprocess/                                # Data cleaning and transformation scripts
│      ├── analysis/                                  # Clustering and differential expression scripts
│      └── visualization/                             # Scripts for generating figures
│
├── results/                                          # Folder for results
│      ├── figures/                                   # Generated figures (e.g., UMAP, dot plots)
│      └── tables/                                    # Processed tables (e.g., DEG lists)
│
├── docs/                                             # Folder for documentation
│      └── MOUSE_Code_Explanation.md                  # Explanation of code and methods
│
├── environment/                                      # Environment setup files
│      ├── requirements.txt                           # Required Python packages
│      └── environment.yml                            # Conda environment configuration
│
└── notebooks/                                        # Jupyter notebooks for interactive exploration
       ├── exploratory_analysis.ipynb                 # Exploratory data analysis
       └── visualization.ipynb                        # Visualization examples
```

