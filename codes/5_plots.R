# Librerías necesarias
library(terra)
library(dplyr)
library(ggplot2)
library(tidyterra)
library(geodata)

NorthAmerica <- gadm(country = country_codes("North America")$ISO3,
                     level = 1, resolution = 2,
                     path = "/Volumes/TOSHIBA EXT/COBERTURAS/Limites")

# Definir la ruta de los archivos del futuro
ruta_futuro <- "WC/ssp126_2021-2040/deltas"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[1]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rastertemp <- terra::rast(raster_list)

NorthAmerica<-terra::vect("/Volumes/TOSHIBA EXT/COBERTURAS/Limites/gadm/")

ggplot() +
  geom_spatraster(data = rastertemp) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "muted",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 12,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la temperatura con relación al presente",
    subtitle = "SSP1 2.6 (2021-2040)"
  )


csvs <- list.files("WC", full.names = TRUE, pattern = ".csv$", recursive = T)
data <- do.call(rbind, lapply(csvs, read.csv))