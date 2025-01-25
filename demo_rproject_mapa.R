library(sf)
library(RColorBrewer)
# Load data
nc <- st_read(system.file("shape/nc.shp", package="sf"))
# Plotting simple features (sf) with plot
plot(nc["AREA"], main = "AREA", breaks = "quantile",
     nbreaks = 9, pal = brewer.pal(9, "YlOrRd"))
tmap_mode("view")
tmap_last()

# UCENTRAL
library(leaflet)
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = -74.0690910091799, lat = 4.60620105, popup = "Bobota")

# Madrid
library(leaflet)
circles <- data.frame(lng = c(-3.7, -3.72),
                      lat = c(40.4, 40.42))
leaflet() %>%
  addTiles() %>%
  setView(lng = -3.7, lat = 40.4, zoom = 13) %>%
  addCircleMarkers(data = circles, color = "red") %>%
  addCircles(data = circles, radius = 2000)

install.packages("remotes")
remotes::install_github("bokeh/rbokeh")
library(rbokeh)
library(maps)
data(world.cities)
caps <- dplyr::filter(world.cities, capital == 1)
caps$population <- prettyNum(caps$pop, big.mark = ",")
plot <- suppressWarnings(figure(width = 800, height = 450, padding_factor = 0) %>%
                           ly_map("world", col = "gray") %>%
                           ly_points(long, lat, data = caps, size = 5,
                                     hover = c(name, country.etc, population)))
widgetframe::frameWidget(plot,width=600,height=400)

## installing spDataLarge
install.packages("spDataLarge", lib = "./")
library(spDataLarge, lib.loc = "./")
#library(spDataLarge)

# Mapas Animados
library(sf)
library(raster)
library(dplyr)
library(spData)
library(tmap) # for static and interactive maps
library(leaflet) # for interactive maps
library(ggplot2) # tidyverse data visualization package
library(gifski)
urb_anim = tm_shape(world) + tm_polygons() +
  tm_shape(urban_agglomerations) + tm_dots(size =
                                             "population_millions") +
  tm_facets(along = "year", free.coords = FALSE)
tmap_animation(urb_anim, filename = "urb_anim.gif", delay =
                 25, col="red")

