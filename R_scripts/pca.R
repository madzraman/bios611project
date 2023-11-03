library(tidyverse)
df <- read_csv("derived_data/df_original_cleaned.csv")

df_numeric <- read_csv("/home/rstudio/work/derived_data/df_original_cleaned_numeric.csv")

pca_result <- prcomp(df_numeric %>% as.matrix())

variance <- (pca_result$sdev)^2
cum_variance <- cumsum(variance) / sum(variance)

#create df for plotting
df_toplot <- data.frame(Dimension = 1:length(cum_variance), CumulativeVariance = cum_variance)

#create ggplot
cum_var_plot <- ggplot(df_toplot, aes(x=Dimension, y=CumulativeVariance)) +
  geom_line() +
  geom_point() +
  geom_hline(yintercept = 0.85) +
  xlab("Principal component") +
  ylab("Cumulative proportion of \nvariance explained") +
  ggtitle("PCA Cumulative Variance")
ggsave("figures/explained_variance.png", plot=cum_var_plot)

#plot pc1 vs pc2
pc1_pc2_plot05 <- ggplot(pca_result$x %>% as_tibble() %>% select(PC1, PC2) %>% slice_sample(prop=0.5), aes(PC1, PC2)) +
  geom_point()
ggsave("figures/pc1_vs_pc2.png", plot=pc1_pc2_plot05)








