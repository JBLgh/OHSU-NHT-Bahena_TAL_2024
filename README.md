# **OHSU-NHT-Bahena_TAL_2024**
This project analyzes single-cell RNA sequencing (sc-RNAseq) data from mouse kidney thick ascending limb (TAL) cells.<br>
TAL cells play a critical role in monovalent and divalent cation transport. Through clustering, differential expression analysis, and visualization, this project aims to identify distinct TAL cell types and their underlying mechanisms.
<br>
## **Features**
✨ Comprehensive analysis of mouse TAL sc-RNAseq data.  
✨ Automated clustering and cell-type annotation.  
✨ Publication-ready figures for zonation and DEG analysis.
<br>

|**Article Description**                                                               |**Link**                                                                                           
|---------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
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
&nbsp; - Figures: Results saved in <code>results/figures/</code> (e.g., <code>UMAP_Zonation.tiff</code>).<br>
&nbsp; - Tables: DEG results saved in <code>results/tables/</code> (e.g., <code>Mouse_TAL_DEG.xlsx</code>).<br>

## Project Directory Structure:
```
OHSU-NHT-Bahena_TAL_2024/
│
├── README.md                                      # Project documentation
├── LICENSE                                        # Licensing information
│
├── data/                                          # Folder for datasets
│      ├── raw/                                    # Raw datasets (e.g., downloaded files, original files)
│      └── processed/                              # Processed datasets for analysis (after running pre-processing scripts)
│
├── R/                                             # Custom R scripts/functions
│      ├── preprocess.R                            # Data cleaning and transformation functions
│      ├── analysis.R                              # Clustering and DEG analysis functions
│      ├── visualization.R                         # Visualization functions (UMAP, violin plots, etc.)
│      └── utils.R                                 # Utility/helper functions (if needed)
│
├── scripts/                                       # Folder for analysis scripts
│      ├── preprocess_data.R                       # Script for running data preprocessing
│      ├── run_analysis.R                          # Script for clustering and DEG analysis
│      ├── generate_figures.R                      # Script for generating publication-ready figures
│
├── results/                                       # Folder for results
│      ├── figures/                                # Generated figures (e.g., UMAP, dot plots)
│      └── tables/                                 # Processed tables (e.g., DEG lists, Mouse_TAL_DEG.xlsx)
│
├── docs/                                          # Folder for documentation
│      └── MOUSE_Code_Explanation.md               # Explanatory Markdown files of code and methods
│
├── environment/                                   # Environment setup files
│      ├── renv.lock                               # Lock file for R package dependencies (generated by renv)
│      ├── renv/                                   # Folder for renv package management
│      └── session_info.txt                        # Record of R session information for reproducibility
│
└── notebooks/                                     # Interactive R Markdown notebooks
       ├── exploratory_analysis.Rmd                # Exploratory data analysis
       └── visualization.Rmd                       # Visualization examples
```

## License
This project is licensed under the [MIT License](License)

