################################################################################
#
# Visualizing the spatial data of Octopus vulgaris literature by country
#
################################################################################
#
# Janelle Kaz
# janellekaz@miami.edu
# Nov 9 2026
#
#
# This dataset contains 101 of the most recent publications retrieved from
# Web of Science using a search for Octopus vulgaris. This script maps the 
# number of publications by primary institutional country to examine 
# the geographical distribution of recent research. 
#
###############################################################################

# SET UP #######################################################################

## Load packages ---------------------------------------------------------------

library(EVR628tools)    # For color palettes
library(tidyverse)      # Data cleaning, manipulation, and ggplot2
library(readxl)         # Read the Excel dataset
library(sf)             # Work with spatial vector data and projections
library(rnaturalearth)  # World country boundaries
library(ggspatial)      # Add the north arrow and scale bar

## Load data -------------------------------------------------------------------

octopus <- read_excel("data/raw/Most_recent_country.xlsx")

# PROCESSING ###################################################################

glimpse(octopus) # inspect data : 101 rows and 1 column

octopus |> count(Country, sort = T) #count publications by country

# Standardize country names and remove extra spaces
octopus <- octopus |>
  mutate(Country = str_squish(Country))

# Count publications by primary institutional country
country_counts <- octopus |>
  count(Country, name = "n_publications")

# verify country counts 
print(country_counts, n = Inf)
sum(country_counts$n_publications)

# Load world country boundaries from Natural Earth
world <- ne_countries(scale = 110, returnclass = "sf")

# Standardize country names to match the literature dataset
world <- world |>
  mutate(
    country_name = if_else(
      name == "United States of America",
      "United States",
      name))

# check for country names that do not match the world dataset
unmatched <- country_counts |>
  anti_join(
    world |> st_drop_geometry(),
    by = c("Country" = "country_name"))

print(unmatched, n = Inf) # = 0 rows

# join publication counts to country boundaries
world_lit <- world |>
  left_join(
    country_counts,
    by = c("country_name" = "Country")) |>
  mutate(
    n_publications = replace_na(n_publications, 0L))

# Check that all 101 publications & 26 countries are represented
sum(world_lit$n_publications)

world_lit |>
  st_drop_geometry() |>
  filter(n_publications > 0) |>
  nrow()


# VISUALIZE ####################################################################

# Create a world map of primary institutional countries
recent_map <- ggplot() +
  geom_sf(             # world boundaries
    data = world,      # Natural Earth country-boundary dataset
    fill = "grey92",
    color = "white",
    linewidth = 0.2) +
  geom_sf(
    data = world_lit |> filter(n_publications > 0), # publication counts
    aes(fill = n_publications),
    color = "white",
    linewidth = 0.2) +
 scale_fill_gradientn(
  colours = c("#d6eef5", "#9ecae1", "#6baed6",
              "#3182bd", "#08519c"),
  trans = "sqrt",         # to make differences between countries with fewer publications easier to see
  name = "Publications") +
  labs(
  title = expression(
    "Geographical distribution of recent " *
      italic("Octopus vulgaris") * " research"),
  subtitle = "Primary institutional country of 101 publications",
 caption = expression(
  "Sources: Web of Science (author-coded " *
    italic("O. vulgaris") *
    " literature); Natural Earth (country boundaries)")) +
 coord_sf(                  # cropped to exclude arctic and Antarctica 
  crs = st_crs(4087),       # used ESPG:4087 World Equidistant Cylindrical in meters
  xlim = c(-20037508, 20037508),
  ylim = c(-6679169, 9462157),
  expand = FALSE) +
  
annotation_north_arrow(     # North arrow positioned above the scale bar from ggspatial
  location = "bl",
  which_north = "grid",
  height = unit(1.2, "cm"),
  width = unit(1.2, "cm"),
  pad_x = unit(0.35, "cm"),
  pad_y = unit(1.5, "cm")) +


annotation_scale(           # Add a scale bar in kilometers from ggspatial
  location = "bl",
  width_hint = 0.12,
  plot_unit = "m",
  unit_category = "metric",
  pad_x = unit(0.35, "cm"),
  pad_y = unit(0.35, "cm")) +
 theme_void() +  # remove axes and gridlines
  theme(
    plot.background = element_rect(fill = "white",  #realized I needed a white background after using the void theme
                                   color = NA),
    panel.background = element_rect(fill = "white",
                                    color = NA),

    plot.margin = margin(t = 20, r = 30,  # Add a little space around the entire figure
                         b = 20, l = 30),

    plot.title.position = "plot",  # Keep title and subtitle left-aligned
    plot.caption.position = "plot",
    plot.title = element_text(hjust = 0,
                              margin = margin(b = 8)),
    plot.subtitle = element_text(hjust = 0,
                                 margin = margin(b = 12)),

    legend.position = c(0.93, 0.46),   # Move legend slightly left
    legend.justification = c("left", "center"))
  
  
# Display the map
recent_map


# ANALYSIS #####################################################################

# Calculate each country's share of publications
country_summary <- country_counts |>
  mutate(
    percentage = round(n_publications
                       / sum(n_publications)
                       * 100, 1)) |>
  arrange(desc(n_publications))

print(country_summary, n = Inf)

# 31.7% of recent research has come out of Spain.
# 50.5% of recent research has come from the top 3
# countries: Spain, Italy, and Portugal. 
# 11 countries are represented by just one publication each.



# EXPORT #######################################################################

ggsave(
  filename = "results/img/recent_map.png",
  plot = recent_map,
  width = 12,
  height = 7,
  units = "in",
  dpi = 300,
  bg = "white"
)

recent_map

browseURL("results/img/recent_map.png")

## The final step --------------------------------------------------------------







#