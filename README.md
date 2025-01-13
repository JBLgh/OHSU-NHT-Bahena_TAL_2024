# OHSU-NHT-Bahena_TAL_2024
# Explanation of MOUSE Code for TAL Analysis
This document explains the steps performed in the provided R code for analyzing sc-RNAseq data from mouse kidney thick ascending limb (TAL) cells.

## Features
This is a dummy line: <br>
✨ .<br>
✨ .<br>
✨ .<br>

## How to Use
## Pre-Processing Steps

1. **Dataset Loading**
```bash
- Download the dataset from [PubMed](https://pubmed.ncbi.nlm.nih.gov/31689386/) and load it using `Seurat::Read10X`. <br>
```
2. **Object Creation:** <br>
```bash
   - Create a Seurat object and perform normalization using `SCTransform`.
```
3. **Dimensionality Reduction:** <br>
```bash
   - Use PCA and UMAP for clustering and visualization.
```
4. **Clustering:**
```
   - Apply `FindNeighbors` and `FindClusters` to group TAL cells.
```
5. **Subset Clusters:**
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
├── README.md
├── LICENSE
├── data/
│   ├── raw/
│   └── processed/
├── scripts/
│   ├── preprocess/
│   ├── analysis/
│   └── visualization/
├── results/
│   ├── figures/
│   └── tables/
├── docs/
│   └── MOUSE_Code_Explanation.md
├── environment/
│   ├── requirements.txt
│   └── environment.yml
└── notebooks/
    ├── exploratory_analysis.ipynb
    └── visualization.ipynb
```

