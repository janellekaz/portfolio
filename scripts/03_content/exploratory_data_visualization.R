################################################################################
# Exploratory data visualization 
################################################################################
#
# Janelle Kaz
# janellekaz@miami.edu
# Oct 9 2026
#
# Exploratory data visualization of most recent
# Octopus vulgaris coded literature
#
# This script uses ggplot2 to explore patterns in 101 recent
# Octopus vulgaris research papers. Figures examine research
# domains, methods, invasiveness, agency recognition, and
# ethical considerations.
# All figures are exported to results/img/.
#
################################################################################


# SET UP ###############################################################

## Load packages
library(tidyverse)

## Load data

vulgaris_clean <- read_rds("data/processed/recent_vulgaris_clean.rds")
vulgaris_long <- read_rds("data/processed/recent_vulgaris_ethical_long.rds")

# Figure 1 : Research domains
## This figure looks at the number of papers in each research category

fig1 <- vulgaris_clean |>
  count(domain, sort = TRUE) |>
  ggplot(aes( x = reorder(domain, n),
              y = n)) +
  geom_col(fill = "cadetblue") +
  geom_text(aes(label = n), hjust = -0.3, size = 3.5) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  coord_flip() +
  labs(title = "Research Categories in Most Recent Octopus vulgaris Studies",
       x = "Research Domain",
       y = "Number of Papers",
       caption = "Source: Author-coded literature review of 101 most recent Octopus vulgaris research papers from Web of Science") +
  theme_minimal() +
  theme(plot.title.position = "panel",
        plot.title = element_text(size = 13,
                                  face = "bold",
                                  hjust = 0),
        plot.caption.position = "panel",
        plot.caption = element_text(size = 9,
                                    color = "gray40",
                                    hjust = 0))

fig1

# Export ################################################################
ggsave(filename = "results/img/research_categories_number_papers.png",
       plot = fig1,
       width = 8,
       height = 10)


#####################################################################################
#Figure 2: Invasiveness by research domain ###########################################
## How are the invasiveness scores distributed across
## research categories/domains?

fig2 <- vulgaris_clean |>
  mutate(invasiveness = factor(invasiveness,
                levels = c("0", "A", "B", "C", "D", "E", "NA-PM"))) |>
  ggplot(aes(x = reorder(domain, domain,
                         function(x) -length(x)), fill = invasiveness)) +
  geom_bar(position = position_stack(reverse = TRUE)) +
  scale_fill_manual(values = c("0" = "gray",
                              "A" = "lightblue1",
                              "B" = "lightgoldenrod1",
                              "C" = "sienna1",
                              "D" = "orangered2",
                              "E" = "red3",
                              "NA-PM" = "gray30")) +
  coord_flip() +
  labs(title = "Invasiveness Across Octopus vulgaris Research Domains",
       x = "Research Domain",
       y = "Number of Studies",
       fill = "Invasiveness",
       caption = "Source: Author-coded data from 101 recent Octopus vulgaris studies retrieved from Web of Science.") +
  theme_minimal() +
  theme(plot.title = element_text(size = 13,
                              face = "bold",
                              hjust = 0.5),
    axis.text.x = element_text(size = 10),
    plot.caption = element_text(size = 9,
                                color = "gray40",
                                hjust = 0),
    legend.position = "inside",
    legend.position.inside = c(0.9, 0.9),
    legend.justification = c(1, 1),
    legend.background = element_rect(fill = "white"),
    legend.text = element_text(size = 10))

fig2

# verify that all papers are included
vulgaris_clean |>
  count(invasiveness, sort = TRUE)

# Export #######################################################################
ggsave(filename = "results/img/invasiveness_by_research_domain.png",
       plot = fig2,
       width = 14,
       height = 8)



################################################################################
# Figure 3: Method type by research domain
## This figure looks at methods used in each research domain
## Research domain names were shortened to fit in the figure

fig3 <- vulgaris_clean |>
  ggplot(aes(x = reorder(domain, domain,
                         function(x) -length(x)), fill = method)) +
  geom_bar(position = "stack") +
  scale_fill_viridis_d() +
  coord_flip() +
  scale_x_discrete(labels = c(
      "Fisheries Management & Commercial Use" = "Fisheries & Commercial Use",
      "Environmental & Ecotoxicological Assessment" = "Environmental Assessment",
      "Reproductive & Developmental Biology" = "Reproduction & Development",
      "Genomics & Molecular Characterization" = "Genomics & Molecular",
      "Biomimetics & Technological Design" = "Biomimetics & Technology",
      "Captive Laboratory Husbandry" = "Captive Husbandry",
      "Comparative Anatomy & Evolution" = "Anatomy & Evolution",
      "Aquaculture & Commercial Rearing" = "Aquaculture & Rearing")) +
  labs(title = "Methods Across Octopus vulgaris Research Domains",
    x = "Research Domain",
    y = "Number of Studies",
    fill = "Method Type",
    caption = "Source: Author-coded data from 101 most recent Octopus vulgaris studies retrieved from Web of Science") +
  theme_minimal() +
  theme(plot.title = element_text(size = 13,
                              face = "bold"),
    axis.text.x = element_text(size = 10),
    plot.caption = element_text(size = 9,
                                color = "gray40",
                                hjust = 0),
    legend.position = "inside",
    legend.position.inside = c(0.98, 0.98),
    legend.justification = c(1, 1),
    legend.background = element_rect(fill = "white"),
    legend.text = element_text(size = 10))


fig3
# Export ################################################################
ggsave(filename = "results/img/research_methods_by_domain.png",
       plot = fig3,
       width = 14,
       height = 8)


########################################################################
# Figure 4: Grouped bar chart of Cognitive Insights
# vs. Ethical Recognition

fig4 <- vulgaris_long |>
  filter(!is.na(recognition)) |>
  ggplot(aes(x = ethical_indicator,
             fill = recognition)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("Yes" = "cadetblue",
                               "No" = "gray70",
                               "Incidental" = "goldenrod")) +
  scale_x_discrete(labels = c(pcwi = "Cognitive/Welfare Insight",
                              statement = "Explicit Ethical Recognition")) +
  labs(title = "Cognitive Insights and Ethical Recognition in Recent Octopus vulgaris Research",
       x = "Ethical Indicator",
       y = "Number of Papers",
       fill = "Recognition",
       caption = "Source: Author-coded ethical recognition indicators for 101 recent Octopus vulgaris papers from the Web of Science") +
  theme_bw() +
  theme(plot.title = element_text(size = 13,
                                  face = "bold"),
        plot.caption = element_text(size = 9,
                                    color = "gray40",
                                    hjust = 0))
fig4

vulgaris_long |>
  count(ethical_indicator, recognition)

    
# Export ################################################################

ggsave(filename = "results/img/cognitive_insights_vs_ethical_recognition.png",
       plot = fig4,
       width = 8,
       height = 10)


#Figure 5: Agency recognition ###########################################
## How are papers distributed across the four levels
## of agency recognition?

fig5 <- vulgaris_clean |>
  ggplot(aes(x = agency)) +
  geom_bar(fill = "cadetblue") +
  labs(title = "Recognition of Octopus Agency in Recent Research",
       x = "Agency Recognition Score",
       y = "Number of Papers",
           caption = "Source: Author-coded agency recognition scores for the 101 most recent studies of Octopus vulgaris retrieved from Web of Science.") +
  theme_bw() +
  theme(plot.title = element_text(size = 13,
                                  face = "bold"),
    plot.caption = element_text(size = 9,
      color = "gray40",
      hjust = 0))

fig5
  
# Export ############################################################# 

ggsave(filename = "results/img/agency_recognition.png",
       plot = fig5,
       width = 8,
       height = 6)  
  
  
  
  
  
  
  
  
  
  
