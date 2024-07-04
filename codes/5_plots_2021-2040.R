library(terra)
library(dplyr)
library(ggplot2)
library(tidyterra)
library(stringr)


rm(list=ls())
NorthAmerica<-terra::vect("/Volumes/TOSHIBA EXT/COBERTURAS/Limites/lev_1.shp")

#Variación de los MCG con respecto al presente####
####ssp126####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp126_2021-2040)");gcm_names

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
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)
names(rasterclima)

#bio1####
#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "viridi",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la temperatura con relación al presente",
    subtitle = "2021-2040, (SSP1 2.6)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_bio1_2021-2040.jpg")

plot.new()
# bio12####
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[12]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)

#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "high_relief",
    labels = scales::label_number(suffix = ""),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la precipitación con relación al presente",
    subtitle = "2021-2040, (SSP1 2.6)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_bio12_2021-2040.jpg")
plot.new()

####ssp370####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_2021-2040/deltas"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp370_2021-2040)");gcm_names

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
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)
names(rasterclima)

plot.new()
#bio1####
#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "viridi",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la temperatura con relación al presente",
    subtitle = "2021-2040, (SSP3 7.0)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_bio1_2021-2040.jpg")
plot.new()
# bio12####
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[12]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)

#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "high_relief",
    labels = scales::label_number(suffix = ""),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la precipitación con relación al presente",
    subtitle = "2021-2040, (SSP3 7.0)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_bio12_2021-2040.jpg")
plot.new()

####ssp585####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_2021-2040/deltas"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp585_2021-2040)");gcm_names

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
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)
names(rasterclima)

#bio1####
#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "viridi",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la temperatura con relación al presente",
    subtitle = "2021-2040, (SSP5 8.5)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_bio1_2021-2040.jpg")
plot.new()
# bio12####
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[12]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)

#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "high_relief",
    labels = scales::label_number(suffix = ""),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Cambio en la precipitación con relación al presente",
    subtitle = "2021-2040, (SSP5 8.5)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_bio12_2021-2040.jpg")
plot.new()

#Variación entre MCG####
####ssp126####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltasEnsamble"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

gcm_names <- str_extract(basename(archivos_futuro), "(?<=)[^_]+(?=_ssp126_2021-2040)");gcm_names

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
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)
names(rasterclima)

#bio1####
#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "viridi",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Variación de la temperatura entre MCG",
    subtitle = "2021-2040, (SSP1 2.6)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_bio1_2021-2040_dEnsembles.jpg")

plot.new()

# bio12####
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[12]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)

#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "high_relief",
    labels = scales::label_number(suffix = ""),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Variación de la precipitación entre MCG",
    subtitle = "2021-2040, (SSP1 2.6)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_bio12_2021-2040_dEnsembles.jpg")
plot.new()

####ssp370####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_2021-2040/deltasEnsamble"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

gcm_names <- str_extract(basename(archivos_futuro), "(?<=)[^_]+(?=_ssp370_2021-2040)");gcm_names

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
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)
names(rasterclima)

#bio1####
#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "viridi",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Variación de la temperatura entre MCG",
    subtitle = "2021-2040, (SSP3 7.0)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_bio1_2021-2040_dEnsembles.jpg")
plot.new()

# bio12####
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[12]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)

#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "high_relief",
    labels = scales::label_number(suffix = ""),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Variación de la precipitación entre MCG",
    subtitle = "2021-2040, (SSP3 7.0)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_bio12_2021-2040_dEnsembles.jpg")
plot.new()

####ssp585####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_2021-2040/deltasEnsamble"
# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

gcm_names <- str_extract(basename(archivos_futuro), "(?<=)[^_]+(?=_ssp585_2021-2040)");gcm_names

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
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)
names(rasterclima)

#bio1####
#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "viridi",
    labels = scales::label_number(suffix = "º"),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Variación de la temperatura entre MCG",
    subtitle = "2021-2040, (SSP5 8.5)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_bio1_2021-2040_dEnsembles.jpg")
plot.new()

# bio12####
# Función para cargar y retornar el primer layer de cada archivo
cargar_primer_layer <- function(file) {
  bio <- terra::rast(file)
  if (nlyr(bio) > 0) {
    return(bio[[12]])
  } 
}

# Leer solo el primer layer de cada archivo y almacenar en una lista
raster_list <- lapply(archivos_futuro, cargar_primer_layer)
# Hacer un stack de la lista
rasterclima <- terra::rast(raster_list)
names(rasterclima)<-(gcm_names)

#plot del cambio en la variable climática
ggplot() +
  geom_spatraster(data = rasterclima) +
  geom_spatvector(data = NorthAmerica, fill = NA) +
  facet_wrap(~lyr, nrow = 3) +
  scale_fill_whitebox_c(
    palette = "high_relief",
    labels = scales::label_number(suffix = ""),
    n.breaks = 10,
    guide = guide_legend(reverse = TRUE)
  ) +
  coord_sf(xlim = c(-117.125, -86.74167), ylim = c(14.53333, 32.71667), expand = FALSE) +
  theme_minimal() +
  #coord_sf(crs = 25830) +
  labs(
    fill = "Variación",
    title = "Variación de la precipitación entre MCG",
    subtitle = "2021-2040, (SSP5 8.5)"
  )

ggsave("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_bio12_2021-2040_dEnsembles.jpg")
plot.new()
