# main_analysis.R FIGURE 4

# Load required packages
library(Seurat)
library(ggplot2)
library(ggsci)
library(here)
library(dplyr)
library(tidyr)
library(tibble)
library(scales)

# Load your Seurat object
SO <- readRDS(here("TAL_Dataset.rds"))
SO

# ---- Figure 4B ----
# Color palette desired with sufficient colors for your plot
nature_colors <- pal_npg("nrc")(length(unique(SO$class.TAL.l2)))
nature_colors[5] <- "#6A0DAD"

# Apply the updated palette to your plot
f4a <- DimPlot(SO, split.by = "zone", group.by = "class.TAL.l2", label = FALSE, reduction = "umap") + 
  scale_y_reverse() + 
  scale_color_manual(values = nature_colors) +  # Use the modified palette
  theme(
    legend.position = "right",
    legend.text = element_text(size = 14),
    legend.key.size = unit(0.8, "cm")  # Adjust legend text size
  ) + 
  guides(color = guide_legend(override.aes = list(size = 5)))  # Increase dot size in the legend

ggsave(here("Figure4B.svg"), plot = f4a, device = "svg")

# ---- Figure 4C ----
TAL.celltype.markers <- c("Slc12a1", "Umod", "Egf", "Cldn10", "Kcnj1", "Cldn16", "Kcnj10", "Casr", "Nos1", "Top2a")

f4b<-DotPlot(SO, features = TAL.celltype.markers, cols = c("lightgrey", "darkblue"),
        dot.scale = 8, dot.min = 0, scale.max = 100, scale.min = 0, col.min = -2.5, col.max = 2.5) +
  coord_flip() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(here("Figure4C.svg"), plot = f4b, device = "svg")

# ---- Figures 4D–4G ----
f4c<-FeaturePlot(SO, features = c("Cldn10", "Cldn16", "Kcnj10", "Kcnj1")) & scale_y_reverse() & 
            theme(axis.title = element_text(size = 12),  
              plot.title = element_text(face = "bold.italic", size = 16),  
              axis.text = element_text(size = 10),
              legend.text = element_text(size = 10)) 

ggsave(here("Figure4D.svg"), plot = f4c, device = "svg")

# ---- Figure 4H ----
Na.markers <- c("Ptger3", "Stk39", "Wnk1", "Wnk4", "Cldn10")

DotPlot(SO, features = Na.markers, group.by = "class.TAL.l2",
        cols = c("lightgrey", "darkblue"),
        dot.scale = 12, dot.min = 0, scale.max = 100,
        scale.min = 0, col.min = -2.5, col.max = 2.5) + 
  theme(axis.text.x = element_text(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5),
        legend.text = element_text(size = 9),
        legend.title = element_text(size = 9)) +
  coord_flip() +
  labs(title = "Sodium")

ggsave(here("figures", "Figure4H.svg"), plot = last_plot(), device = "svg")

# ---- AVPR2 Heatmap ----
df <- AverageExpression(object = SO, features = "Avpr2", group.by = "class.TAL.l2")$RNA
df <- t(scale(t(df)))

df_tidy <- df %>%
  as.data.frame() %>%
  rownames_to_column(var = "Gene") %>%
  pivot_longer(cols = -Gene, names_to = "class.TAL.l2", values_to = "Expression")

df_tidy$class.TAL.l2 <- factor(df_tidy$class.TAL.l2, 
                              levels = c("TAL α", "TAL β", "TAL γ", "MD", "Prol"))

f4h.2<-ggplot(df_tidy, aes(x = class.TAL.l2, y = Gene, fill = Expression)) +
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
  labs(x = "Cell Type", y = "Avpr2", fill = "Expression")

f4h.2

ggsave(here("figures", "AVPR2_heatmap.svg"), plot = f4h.2, device = "svg")

# ---- Figure 4I ----
Ca.markers <- c("Cnnm2", "Vdr","Pth1r", "Casr", "Cldn19", "Cldn16")

f4i<-DotPlot(SO,
        features = c(Ca.markers), group.by = "class.TAL.l2",
        cols = c("lightgrey", "darkblue"),
        dot.scale = 12,
        dot.min = 0,
        scale.max = 100,
        scale.min = 0,
        col.min = -2.5,
        col.max = 2.5) + 
  theme(axis.text.x = element_text(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5),
        legend.text = element_text(size = 9),
        legend.title = element_text(size = 9)) +   RotatedAxis() + coord_flip() + labs(title = "Calcium & Magnesium")

ggsave(filename = here("Figure4I.svg"), plot = f4i, device = "svg")



# ---- Cldn14 Heatmap ----

df <- AverageExpression(object = SO, features = "Cldn14", group.by = 'class.TAL.l2')$RNA
df

df <- t(scale(t(df)))

df_tidy <- df %>%
  as.data.frame() %>%
  rownames_to_column(var = "Gene") %>%
  pivot_longer(cols = -Gene, names_to = "class.TAL.l2", values_to = "Expression")

df_tidy$class.TAL.l2 <- factor(df_tidy$class.TAL.l2, 
                              levels = c("TAL α", 
                                         "TAL β",
                                         "TAL γ",
                                         "MD", "Prol"))

f4i.2<-ggplot(df_tidy, aes(x = class.TAL.l2, y = Gene, fill = Expression)) +
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
  labs(x = "Cell Type", y = "Cldn14", fill = "Expression")
  
ggsave(filename = here("CLDN14_hEATMAP.svg"), plot = f4i.2, device = "svg")




# ---- Figure 4J ----
K.markers <- c("Kcnt1", "Kcnj16", "Kcnj10", "Kcnj1", "Kcnma1")

f4j<-DotPlot(SO,
        features = c(K.markers), group.by = "class.TAL.l2",
        cols = c("lightgrey", "darkblue"),
        dot.scale = 12,
        dot.min = 0,
        scale.max = 100,
        scale.min = 0,
        col.min = -2.5,
        col.max = 2.5) + 
  theme(axis.text.x = element_text(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5),
        legend.text = element_text(size = 9),
        legend.title = element_text(size = 9)) +   RotatedAxis() + coord_flip() + labs(title = "Potassium")

ggsave(filename = here("Figure4J.svg"), plot = f4j, device = "svg")
 

