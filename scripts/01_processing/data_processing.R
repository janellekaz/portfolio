################################################################################
# Coded O_vulgaris literature data
################################################################################
#
# Janelle Kaz
# janellekaz@miami.edu
# Oct 09 2026
#
# This script reads the raw CSV data from a literature review
# and cleans it for analysis.  
#
################################################################################

# SET UP ################################################################

## Load packages
library(readxl)
library(tidyverse)
library(janitor)

## Load data

coded_recent <- read_excel(path = "data/raw/coded_most_recent_vulgaris.xlsx",
                           sheet = "Sheet1",
                           range = "A1:F102") |>
  clean_names()

# Get to know my data
dim(coded_recent) # Check dimensions
colnames(coded_recent) # Check column names

# PROCESSING ##################################################

# The data contain 101 entries (rows) and 6 columns
# of coding parameters. 

## Modify column names

clean_recent <- coded_recent |>
  rename(domain = primary_research_category,
         pcwi = presence_of_cognitive_welfare_insight,
         agency = agency_score,
         statement = explicit_ethics_welfare_recognition,
         method = method_type,
         invasiveness = invasiveness_score)

# Inspect my new tibble
clean_recent

# Add unique paper identifier and define categorical variables:

recent_vulgaris <- clean_recent |>
  mutate(paper_id = row_number(),
    across(where(is.character), str_squish),
    domain = as.factor(domain),
    pcwi = as.factor(pcwi),
    agency = factor(agency,
                    levels = c(0, 1, 2, 3),
                    ordered = TRUE),
    statement = as.factor(statement),
    method = as.factor(method),
    invasiveness = as.factor(invasiveness)) |>
  relocate(paper_id, .before = 1)

# Count the number of papers in each research domain/category
recent_vulgaris |>
  count(domain, sort = TRUE)

# RESHAPING ####################################################

# Reshape ethical recognition variable into long format
# Each paper has one observation for each ethical indicator

ethical_long <- recent_vulgaris |>
  pivot_longer(cols = c(pcwi, statement),
               names_to = "ethical_indicator",
               values_to = "recognition")

dim(ethical_long) # inspect reshaped data
glimpse(ethical_long)

# Count papers recognizing each ethical indicator

ethical_summary <- ethical_long |>
  group_by(ethical_indicator, recognition) |>
  summarise(n_papers = n(),
            .groups = "drop")

ethical_summary # view summary


# EXPORT #################################################################

write_rds(x = recent_vulgaris, 
          file = "data/processed/recent_vulgaris_clean.rds")

write_rds( x = ethical_long, 
           file = "data/processed/recent_vulgaris_ethical_long.rds")


