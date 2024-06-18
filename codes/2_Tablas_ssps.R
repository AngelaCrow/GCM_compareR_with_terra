library(tidyverse)
library(terra)
library(stringr)
library(purrr)

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

####ssp126####
# Definir los archivos de futuro y sus respectivos nombres de modelos
futuro_files <- list.files("WC/ssp126_2021-2040", full.names = TRUE, pattern = ".tif$")
results1 <- map_dfr(futuro_files, ~ {
  modelo <- str_extract(.x, "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp126_2021-2040)")
  procesar_raster(.x, maskara, modelo, "meanFuture")
}) %>%
  dplyr::mutate(Year = "2021-2024", 
                SSP = "SSP1 2.6", 
                Tipo = "medias_ssp126_2021-2040")

####ssp370####
# Definir los archivos de futuro y sus respectivos nombres de modelos
futuro_files <- list.files("WC/ssp370_2021-2040", full.names = TRUE, pattern = ".tif$")
results2 <- map_dfr(futuro_files, ~ {
  modelo <- str_extract(.x, "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp370_2021-2040)")
  procesar_raster(.x, maskara, modelo, "meanFuture")
}) %>%
  dplyr::mutate(Year = "2021-2024", 
                SSP = "SSP3 7.0", 
                Tipo = "medias_ssp370_2021-2040")

####ssp585####
# Definir los archivos de futuro y sus respectivos nombres de modelos
futuro_files <- list.files("WC/ssp585_2021-2040", full.names = TRUE, pattern = ".tif$")
results3 <- map_dfr(futuro_files, ~ {
  modelo <- str_extract(.x, "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp585_2021-2040)")
  procesar_raster(.x, maskara, modelo, "meanFuture")
}) %>%
  dplyr::mutate(Year = "2021-2024", 
                SSP = "SSP5 8.5", 
                Tipo = "medias_ssp585_2021-2040")

# Unir los resultados de cada ssp
results<-rbind(results1, results2, results3)

# Guardar los resultados
write.csv(results, "WC/MeanBio_2021-2040.csv", row.names = F)

