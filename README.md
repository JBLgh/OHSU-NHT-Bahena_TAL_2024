# Explanation of MOUSE Code for TAL Analysis
This document explains the steps performed in the provided R code for analyzing sc-RNAseq data from mouse kidney thick ascending limb (TAL) cells.

## Features
✨ Comprehensive analysis of mouse TAL sc-RNAseq data. <br>
✨ Automated clustering and cell-type annotation. <br>
✨ Publication-ready figures for zonation and DEG analysis. <br>


## Pre-Processing Steps
1. **Dataset Loading**  
   - Download the dataset from [PubMed](https://pubmed.ncbi.nlm.nih.gov/31689386/) and load it using `Seurat::Read10X`.

2. **Object Creation**  
   - Create a Seurat object and normalize data using `SCTransform`.

3. **Dimensionality Reduction**  
   - Perform PCA and UMAP for clustering and visualization.

4. **Clustering**  
   - Group TAL cells using `FindNeighbors` and `FindClusters`.

5. **Subset Clusters**  
   - Extract specific TAL clusters for detailed analysis.


## How to Use

### 1. Pre-Processing Data
Run the following command to preprocess raw datasets:
```bash
python scripts/preprocess/preprocess_data.py
```

### 2. Perform Analysis
Run clustering and DEG analysis with:
```bash
python scripts/analysis/run_analysis.py
```

### 3. Generate Figures  
Figures like UMAP plots, violin plots, and dot plots were generated to highlight TAL cell types, DEG, and zonation markers. Scripts for these plots can be found in `scripts/visualization/generate_figures.py`.
Create publication-ready visualizations:
```bash
python scripts/visualization/generate_figures.py
```

### 4. Saving Results
Outputs include:
- Figures in `.tiff` format (e.g., `results/figures/UMAP_Figure.tiff`).
- DEG results in `.xlsx` format (e.g., `results/tables/Mouse_TAL_DEG.xlsx`).

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
