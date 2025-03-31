#DEG ANALYSIS

# SETUP
library(Seurat)
library(dplyr)
library(tibble)
library(kableExtra)
library(openxlsx)
library(here)

Idents(SO) <- "class.TAL.l2"
levels(x = SO)
DefaultAssay(SO) <- "RNA"

# DEGs that Define Each Cluster

## Step 1: Set the active identity of the object
Idents(SO) <- "class.TAL.l2"
levels(x = SO)
DefaultAssay(SO) <- "RNA"

Idents(SO) <- SO@meta.data$class.TAL.l2

## Step 2: Collect the names of the clusters
clusters <- unique(SO@meta.data$class.TAL.l2)
clusters <- levels(clusters)
names(clusters) <- clusters


## Step 3: Create a new environemnt to stash the DEG lists

DEG.env <- new.env()

## Step 4: Loop through creating DEG for each population
### Creates DEG list
### Orders DEG list by log2FC
### Save DEG list into special environment
### Prints out top 10 DEG list
### Save DEG lists into a .RData file





# Loop over each cluster
for (i in clusters) {
  
  # Find marker genes for the current cluster
  DEGs <- FindMarkers(SO, ident.1 = i, logfc.threshold = 0.1, min.pct = 0.3)
  
  # Process DEGs: Add gene names, filter significant, sort by log fold-change
  DEGs <- DEGs %>%
    rownames_to_column("gene") %>%
    filter(p_val_adj < 0.05) %>%
    arrange(desc(avg_log2FC))
  
  # Store DEGs in the DEG.env environment, using a safe variable name
  assign(paste0("DEGs_", gsub(" ", "_", i)), DEGs, envir = DEG.env)

  # Select top 10 DEGs
  DEGs_top10 <- head(DEGs, 10)

  # Format table using kableExtra
  df <- DEGs_top10 %>%
    kbl(caption = paste("Top 10 DEGs from", i, "Cluster")) %>%
    kable_styling(bootstrap_options = c("striped", "hover"), font_size = 20)

  print(df)  # Display table

}

# Save all DEG objects from the environment
list_objects <- ls(DEG.env)

save(list = list_objects, file = here("TAL_DEGs_March06.Rdata"), envir = DEG.env)


# Write DEGs to Excel
## Grab the list of DEGs from tohe special enviroment
## Write the DEGs in the order of clusters
## Write the excel file

# List all objects in DEG.env
allobj <- ls(DEG.env)
alldf <- sapply(allobj, get, simplify = FALSE, envir = DEG.env)

# Print for debugging
print(allobj)
sapply(allobj, function(x) class(get(x, envir = DEG.env)))

# Ensure only data frames are kept
alldf <- alldf[vapply(alldf, inherits, logical(1), "data.frame")]

# Ensure the cluster order matches stored objects
custom_order <- clusters  # Use clusters directly (not levels())

# Ensure object names match expected order
ordered_names <- paste0("DEGs_", gsub(" ", "_", custom_order))  # Convert to expected object names

# Filter only the matching names
alldf <- alldf[ordered_names[ordered_names %in% names(alldf)]]

# Debugging: Print names to ensure correct order
print(names(alldf))

# Check if alldf is empty before writing
if (length(alldf) > 0) {
  write.xlsx(alldf, sheetName = names(alldf), file = here("TAL_DEGs_March06.xlsx"))
} else {
  message("No data frames found. Check if DEGs were stored correctly.")
}

