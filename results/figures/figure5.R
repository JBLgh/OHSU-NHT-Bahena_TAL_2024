# main_analysis.R FIGURE 5

# ---- Figure 5A Heatmap ----
plot_heatmap_by_zone <- function(seurat_obj, gene, output_filename) {
  library(dplyr)
  library(tidyr)
  library(tibble)
  library(ggplot2)
  library(here)
  library(glue)
  
  # Calculate average expression
  df <- AverageExpression(object = seurat_obj, features = gene, group.by = c('class.TAL.l2', 'zone'))$RNA
  
  # Return if gene is not found
  if (is.null(df) || nrow(df) == 0) {
    message(glue("⚠️ Gene '{gene}' not found or not expressed in the dataset."))
    return(NULL)
  }
  
  # Normalize expression
  df <- t(scale(t(df)))

  # Prepare tidy dataframe
  df_tidy <- df %>%
    as.data.frame() %>%
    rownames_to_column(var = "Gene") %>%
    pivot_longer(cols = -Gene, names_to = "class.TAL.l2", values_to = "Expression")

  # Define the desired order and filter
  included_classes <- c("TAL α_Cortex", "TAL β_Cortex", 
                        "TAL α_Medulla", "TAL β_Medulla", 
                        "TAL γ_Medulla")

  df_tidy$class.TAL.l2 <- factor(df_tidy$class.TAL.l2, levels = included_classes)
  df_tidy <- df_tidy %>% filter(class.TAL.l2 %in% included_classes)

  # Plot
  p <- ggplot(df_tidy, aes(x = class.TAL.l2, y = Gene, fill = Expression)) +
    geom_tile(color = "gray70", size = 0.1, width = 0.97, height = 0.90) +  
    scale_fill_gradient(low = "gray", high = "darkblue") +                  
    theme_minimal() +
    coord_fixed() +                                                        
    scale_y_discrete(labels = NULL) +                                      
    theme(
      axis.text.x = element_text(size = 12, angle = 45, hjust = 1, face = "italic"), 
      axis.text.y = element_blank(),                                                
      axis.title.y = element_text(size = 16, face = "bold"),                         
      axis.title.x = element_text(size = 16, face = "bold"),                         
      axis.ticks.y = element_blank(),                                               
      panel.grid.major = element_line(color = "gray80", size = 0.5),                
      panel.grid.minor = element_blank(),
      panel.border = element_rect(color = "black", fill = NA, size = 1),
      legend.position = "right",                                                   
      legend.title = element_text(size = 14, face = "bold"),                       
      legend.text = element_text(size = 12)                                        
    ) +
    labs(x = "Cell Type", y = gene, fill = "Expression")

  # Save plot
  ggsave(filename = here("figures", output_filename), plot = p, device = "svg")
  
  # Show in viewer
  print(p)
  
  return(p)
}

plot_heatmap_by_zone(SO2, "Casr",    "Casr_heatmap.svg")
plot_heatmap_by_zone(SO2, "Avpr2",   "Avpr2_heatmap.svg")
plot_heatmap_by_zone(SO2, "Knct1",   "Knct1_heatmap.svg")
plot_heatmap_by_zone(SO2, "Slc9a2",  "Slc9a2_heatmap.svg")
plot_heatmap_by_zone(SO2, "Slc9a3",  "Slc9a3_heatmap.svg")


# ---- Figure 5B-D Enriched_TAL vs Whole-kidney_TALsubsetted ----

# LOAD LIBRARIES
library(Seurat)
library(ggplot2)
library(ggsci)
library(viridis)
library(here)

# LOAD DATASETS
# Load enriched TAL dataset
SO <- readRDS(here("Enriched_TAL_Dataset.rds"))

# Load whole-kidney subsetted TAL dataset (Ransick et al.)
SO1 <- readRDS(here("Whole_kidney_subset_TAL_dataset_Ransick.rds"))
Idents(SO1) <- SO1@meta.data$class.TAL

# --------Figure 5B----------------------------------
# UMAP by CELL TYPE

umap1 <- as.data.frame(Embeddings(SO, reduction = "umap"))
umap1$zone <- SO@meta.data$class.TAL.l2
umap1$Dataset <- "SO"

umap2 <- as.data.frame(Embeddings(SO1, reduction = "umap"))
umap2$zone <- SO1@meta.data$class.TAL
umap2$Dataset <- "SO1"

umap2_flipped <- umap2
umap2_flipped$UMAP_1 <- umap2$UMAP_2
umap2_flipped$UMAP_2 <- umap2$UMAP_1

colnames(umap1) <- c("UMAP_1", "UMAP_2", "zone", "Dataset")
colnames(umap2_flipped) <- c("UMAP_1", "UMAP_2", "zone", "Dataset")
umap_combined <- rbind(umap1, umap2_flipped)
umap_combined$Dataset <- factor(umap_combined$Dataset, levels = c("SO", "SO1"))

f2 <- ggplot(umap_combined, aes(x = UMAP_1, y = UMAP_2, color = zone)) +
  geom_point(aes(shape = Dataset), alpha = 0.8, size = 1.2) +
  scale_color_npg() +
  scale_y_reverse() +
  facet_wrap(~Dataset, ncol = 2) +
  labs(
    title = "UMAP Clusters by Cell Type (Side-by-Side)",
    x = "UMAP_1", y = "UMAP_2", color = "Zone", shape = "Dataset"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10),
    panel.grid = element_blank()
  )

# Save
ggsave(
  here("INTACTvswhole-kidney_celltypes.tiff"),
  plot = f2, device = "tiff",
  width = 14, height = 7, units = "in", dpi = 700, compression = "lzw"
)


# --------Figure 5C----------------------------------
# UMAP by KIDNEY ZONES

# Prepare UMAPs
umap1 <- as.data.frame(Embeddings(SO, reduction = "umap"))
umap1$zone <- SO@meta.data$zone
umap1$Dataset <- "SO"

umap2 <- as.data.frame(Embeddings(SO1, reduction = "umap"))
umap2$zone <- SO1@meta.data$Zones
umap2$Dataset <- "SO1"

# Flip SO1 coordinates
umap2_flipped <- umap2
umap2_flipped$UMAP_1 <- umap2$UMAP_2
umap2_flipped$UMAP_2 <- umap2$UMAP_1

# Standardize column names and combine
colnames(umap1) <- c("UMAP_1", "UMAP_2", "zone", "Dataset")
colnames(umap2_flipped) <- c("UMAP_1", "UMAP_2", "zone", "Dataset")
umap_combined <- rbind(umap1, umap2_flipped)
umap_combined$Dataset <- factor(umap_combined$Dataset, levels = c("SO", "SO1"))

# Plot
f1 <- ggplot(umap_combined, aes(x = UMAP_1, y = UMAP_2, color = zone)) +
  geom_point(aes(shape = Dataset), alpha = 0.8, size = 1) +
  scale_color_brewer(palette = "Set1") +
  scale_y_reverse() +
  facet_wrap(~Dataset, ncol = 2) +
  labs(
    title = "UMAP Clusters by Zone (Side-by-Side)",
    x = "UMAP_1", y = "UMAP_2", color = "Zone", shape = "Dataset"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10),
    panel.grid = element_blank()
  )

# Save
ggsave(
  here("INTACTvswhole-kidney_zones.tiff"),
  plot = f1, device = "tiff",
  width = 14, height = 7, units = "in", dpi = 700, compression = "lzw"
)



# --------Figure 5D----------------------------------
# GENE EXPRESSION (Kcnj10)

gene_of_interest <- "Kcnj10"

umap1 <- as.data.frame(Embeddings(SO, reduction = "umap"))
colnames(umap1) <- c("UMAP_1", "UMAP_2")
umap1$Dataset <- "SO"
umap1$Expression <- FetchData(SO, vars = gene_of_interest)[, 1]

umap2 <- as.data.frame(Embeddings(SO1, reduction = "umap"))
colnames(umap2) <- c("UMAP_1", "UMAP_2")
umap2$Dataset <- "SO1"
umap2$Expression <- FetchData(SO1, vars = gene_of_interest)[, 1]

# Flip SO1
umap2_flipped <- umap2
umap2_flipped$UMAP_1 <- umap2$UMAP_2
umap2_flipped$UMAP_2 <- umap2$UMAP_1

# Combine
umap_combined <- rbind(umap1, umap2_flipped)

f3 <- ggplot(umap_combined, aes(x = UMAP_1, y = UMAP_2, color = Expression)) +
  geom_point(alpha = 0.5, size = 1) +
  scale_color_gradient(low = "gray", high = "darkblue") +
  scale_y_reverse() +
  labs(
    title = paste("Expression of", gene_of_interest,

# Save
ggsave(
  here("INTACTvswhole-kidney_zones.tiff"),
  plot = f3, device = "tiff",
  width = 14, height = 7, units = "in", dpi = 700, compression = "lzw"
)
