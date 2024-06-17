library(tidyverse)
library(terra)

rm(list=ls())

# Definir el raster de máscara
maskara <- terra::rast("malla_1kmPR_sI_g.tif")

# Función para procesar un raster
procesar_raster <- function(file_path, maskara, gcm_name, delta_value) {
  # Cargar el raster y recortarlo según la máscara
  raster_cortado <- terra::crop(terra::rast(file_path), maskara)
  
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
presente_path <- list.files("wc2.1_30s_bio/", full.names = TRUE, pattern = ".tif$")
presente <- terra::crop(terra::rast(presente_path), maskara)

nombres_presente <- names(presente);nombres_presente

indice_orden_presente <- order(as.numeric(sub(".*_(\\d+)$", "\\1", nombres_presente)));indice_orden_presente

# Reorganizar el `presente` según el orden de `futuro`
presente <- presente[[indice_orden_presente]];presente
names(presente)

nombre_salida_p <- paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/", "wc2.1_30s_bio_Mexico.tif")
terra::writeRaster(presente, nombre_salida_p, overwrite = TRUE)

medias_presente <- global(presente, fun = mean, na.rm = TRUE)
x.stats <- data.frame(
  Variable = paste("wc2_", 1:19, sep = ""),
  x.mean = medias_presente,
  GCM = "Baseline",
  Year = "1981-2010", 
  SSP = "NULL")

write.csv(x.stats, "MeanBio_Presente.csv", row.names = F)

# Definir los archivos de futuro y sus respectivos nombres de modelos
futuro_files <- list.files("ssp126_2021-2040", full.names = TRUE, pattern = ".tif$")
results <- map_dfr(futuro_files, ~ {
  modelo <- str_extract(.x, "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp126_2021-2040)")
  procesar_raster(.x, maskara, modelo, "meanFuture")
}) %>%
  dplyr::mutate(Year = "2021-2024", SSP = "SSP1 2.6")

# Guardar los resultados
write.csv(results, "ssp126_2021-2040/MeanBio_Futuro.csv", row.names = F)