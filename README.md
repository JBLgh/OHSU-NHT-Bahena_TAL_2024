# OHSU-NHT-Bahena_TAL_2024

## Features
This is a dummy line: <br>
✨ .<br>
✨ .<br>
✨ .<br>
✨ .<br>

## How to Use

1. xxx <br>
```bash
This is a dummy line
```
2. xxx: <br>
```bash
This is a dummy line
```
3. xxx: <br>
```bash
This is a dummy line
```
4. xxx: <br>
```bash
This is a dummy line
```


# Explanation of MOUSE Code for TAL Analysis

This document explains the steps performed in the provided R code for analyzing sc-RNAseq data from mouse kidney thick ascending limb (TAL) cells.

## Pre-Processing Steps
1. **Dataset Loading:**
   - Download the dataset from [PubMed](https://pubmed.ncbi.nlm.nih.gov/31689386/) and load it using `Seurat::Read10X`.

2. **Object Creation:**
   - Create a Seurat object and perform normalization using `SCTransform`.

3. **Dimensionality Reduction:**
   - Use PCA and UMAP for clustering and visualization.

4. **Clustering:**
   - Apply `FindNeighbors` and `FindClusters` to group TAL cells.

5. **Subset Clusters:**
   - Extract specific TAL clusters for further analysis.

## Visualization
Figures like UMAP plots, violin plots, and dot plots were generated to highlight TAL cell types, DEG, and zonation markers. Scripts for these plots can be found in `scripts/visualization/generate_figures.py`.

## Saving Results
- Outputs include figures in `.tiff` format and DEG results in `.xlsx`.

Refer to the respective script for further details.
