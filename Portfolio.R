# Load packages
library(EVR628tools)
library(tidyverse)
data(data_lionfish)
EVR628tools::create_dirs()
usethis::git_vaccinate()

#The following will include the project's R Script
# Create a simple plot
p <- ggplot(data_lionfish,
            aes(x = depth_m, y = total_weight_gr)) +
  geom_point()
p
# Save plot

ggsave(plot = p, filename = "results/img/first_plot.png")
