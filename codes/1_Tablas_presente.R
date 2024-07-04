library(tidyverse)
library(terra)
library(stringr)
library(purrr)

rm(list=ls())

# Definir el raster de máscara
#maskara <- terra::rast("malla_1kmPR_sI_g.tif")
maskara <- terra::vect("malla_1kmPR_sI_g.shp")
ruta<-"/Volumes/TOSHIBA EXT/COBERTURAS/WC"
# Función para procesar un raster
procesar_raster <- function(file_path, maskara, gcm_name, delta_value) {
  # Cargar el raster y recortarlo según la máscara
  raster_cortado <- terra::crop(terra::rast(file_path), maskara, mask =T)
  raster_cortado <- terra::mask(raster_cortado, maskara)
  # Calcular la media global ignorando los NA
  medias <- global(raster_cortado, fun = mean, na.rm = TRUE)
  
  # Crear un dataframe con los resultados
  result_df <- data.frame(
    Variable = paste("wc2_", 1:19, sep = ""),
    x.mean = medias,
    GCM = gcm_name
    )
  
  return(result_df)
}

# Procesar el raster "presente"
presente_path <- list.files(paste0(ruta,"/wc2.1_30s_bio/"), full.names = TRUE, pattern = ".tif$")
presente <- terra::crop(terra::rast(presente_path), maskara)
presente <- terra::mask(presente, maskara)
#plot(presente)
nombres_presente <- names(presente);nombres_presente
indice_orden_presente <- order(as.numeric(sub(".*_(\\d+)$", "\\1", nombres_presente)));indice_orden_presente

# Reorganizar el `presente` según el orden de `futuro`
presente <- presente[[indice_orden_presente]];presente
names(presente)

nombre_salida_p <- paste0(ruta, "/wc2.1_30s_bio_Mexico.tif")
terra::writeRaster(presente, nombre_salida_p, overwrite = TRUE)

medias_presente <- global(presente, fun = mean, na.rm = TRUE)
x.stats <- data.frame(
  Variable = paste("wc2_", 1:19, sep = ""),
  x.mean = medias_presente,
  GCM = "Baseline",
  Year = "1981-2010", 
  SSP = "NULL", 
  Tipo = "medias_presente")

write.csv(x.stats, paste0(ruta,"/MeanBio_Presente.csv", row.names = F))

