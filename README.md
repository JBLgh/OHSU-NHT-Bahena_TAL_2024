# **OHSU-NHT-Bahena_TAL_2024**
Thick ascending limb (TAL) cells play a critical role in monovalent and divalent cation transport. Through clustering, differential expression analysis, and visualization.This project aims to:<br>
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-kidney-icon-download-in-svg-png-gif-file-formats--organ-health-medical-pack-healthcare-icons-20102.png?f=webp&w=512" title="Kidney2" alt="Kidney2" width="35" height="35"/> Identify distinct TAL cell types and their underlying mechanisms.<br>
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-kidney-icon-download-in-svg-png-gif-file-formats--organ-health-medical-pack-healthcare-icons-20102.png?f=webp&w=512" title="Kidney2" alt="Kidney2" width="35" height="35"/>Analyzes single-nuclei RNA sequencing (sn-RNAseq) data from mouse kidney TAL cells.<br>
<br>

## **Features**
✨ Comprehensive analysis of mouse TAL sn-RNAseq data.  
✨ Automated clustering and cell-type annotation.  
✨ Publication-ready figures for zonation and DEG analysis.
<br><br>

|**Article Description**                                                                  |**Link**                                                                                           
|-----------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| 🧬 Distinct TAL cell types reveal mechanisms of monovalent and divalent cation transport | [`📄 Preprint Article`](https://www.biorxiv.org/content/10.1101/2025.01.16.633282v1) |
<br>

## **Pre-Processing Steps**
1. **Dataset Loading**  
   - Download the dataset from [PubMed](https://pubmed.ncbi.nlm.nih.gov/31689386/) and load it using `Seurat::Read10X`.

2. **Object Creation**  
   - Create a Seurat object and normalize the data using `SCTransform`.

3. **Dimensionality Reduction**  
   - Perform PCA and UMAP for clustering and visualization.

4. **Clustering**  
   - Group TAL cells using `FindNeighbors` and `FindClusters`.

5. **Subset Clusters**  
   - Extract specific TAL clusters for detailed analysis.

---

## **How to Use**
1. **Set Up the Environment**<br>
   Use `renv` to install the required R packages:
   ```R
   renv::restore()
   ```

2. **Run Preprocessing**<br>
   Preprocess raw datasets:
   ```R
   source("scripts/preprocess_data.R")
   ```

3. **Perform Analysis**<br>
   Perform clustering and DEG analysis:
    ```R
    source("scripts/run_analysis.R")
    ```

4. **Generate Figures**<br>
   Create publication-ready visualizations:
   ```R
   source("scripts/generate_figures.R")
   ```

5. **Explore Data Interactively**<br>
   Open the R Markdown notebooks in <code>notebooks/</code> using RStudio for exploratory data analysis or visualization:
   - Exploratory Analysis: notebooks/exploratory_analysis.Rmd
   - Visualization: notebooks/visualization.Rmd

6. **View Outputs**<br>
   - Figures: Results saved in <code>results/figures/</code> (e.g., <code>UMAP_Zonation.tiff</code>).<br>
   - Tables: DEG results saved in <code>results/tables/</code> (e.g., <code>Mouse_TAL_DEG.xlsx</code>).<br>

## Project Directory Structure:
```
OHSU-NHT-Bahena_TAL_2024/
│
├── README.md                                      # Project documentation
├── LICENSE                                        # Licensing information
│
├── analysis/                                          
│      ├── DEG.R/                                    
│      
│
├── figures/                                            
       ├── figure4.R                            
       ├── figure5.R                              

```

## License
This project is licensed under the [MIT License](License)

