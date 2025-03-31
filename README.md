# **OHSU-NHT-Bahena_TAL_2024**
Thick ascending limb (TAL) cells play a critical role in monovalent and divalent cation transport. Through clustering, differential expression analysis, and visualization.This project aims to:<br>
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-kidney-icon-download-in-svg-png-gif-file-formats--organ-health-medical-pack-healthcare-icons-20102.png?f=webp&w=512" title="Kidney2" alt="Kidney2" width="35" height="35"/> Identify distinct TAL cell types and their underlying mechanisms.<br>
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-kidney-icon-download-in-svg-png-gif-file-formats--organ-health-medical-pack-healthcare-icons-20102.png?f=webp&w=512" title="Kidney2" alt="Kidney2" width="35" height="35"/>Analyzes single-nuclei RNA sequencing (sn-RNAseq) data from mouse kidney TAL cells.<br>
<br>

- **DCT snRNA-Seq data for further exploration:**
[Interactive web tool](https://ellisonlab.shinyapps.io/tal_shinycell/)
 
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
After the Pre-Processing steps above. . .
1. Download `merged_code.rmd` file from this repo.
2. Open file in `RStudio`
3. `knit` it to `html`

## Project Directory Structure:
```
OHSU-NHT-Bahena_TAL_2024/
│
├── README.md                                      # Project documentation
├── LICENSE                                        # Licensing information
│
├── analysis/                                          
│      ├── DEG.R/                                  # Differential Gene Expression (DGE) to compare gene expression levels between sample groups                            
│      
│
├── figures/                                            
       ├── figure4.R                            
       ├── figure5.R                              

```

## License
This project is licensed under the [MIT License](License)

