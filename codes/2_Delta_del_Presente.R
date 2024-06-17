library(tidyverse)
library(terra)

rm(list=ls())

# Cargar la máscara
maskara <- terra::rast("malla_1kmPR_sI_g.tif")

#Función para procesar un raster
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

# Cargar las variables del presente
presente <- terra::rast("wc2.1_30s_bio_Mexico.tif")
names(presente)

# Definir la ruta de los archivos del futuro
ruta_futuro <- "ssp126_2021-2040"

# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$");archivos_futuro

# Crear un directorio para los deltas si no existe
dir.create(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/",ruta_futuro,"/deltas"), showWarnings = FALSE)

# Función para calcular diferencias 
calcular_diferencias <- function(presente, futuro_path, maskara) {
  # Cargar y recortar el raster futuro
  futuro <- terra::crop(terra::rast(futuro_path), maskara)
  
  # Verificar que tengan el mismo número de capas
  if (terra::nlyr(presente) != terra::nlyr(futuro)) {
    warning(paste("El número de capas no coincide:", basename(futuro_path)))
    return(NULL)
  }
  
  # Calcular la diferencia
  diferencia <- futuro - presente
  
  # Guardar el raster de diferencia
  nombre_salida <- paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.", basename(futuro_path))
  terra::writeRaster(diferencia, nombre_salida, overwrite = TRUE)
}

# Calcular diferencias y estadísticas para todos los archivos del futuro
resultados <- lapply(archivos_futuro, calcular_diferencias, presente = presente, maskara = maskara)


#Tabla de las media globales de cada delta a futuro
futuro_files <- list.files("ssp126_2021-2040/deltas/", full.names = TRUE, pattern = ".tif$")

results <- map_dfr(futuro_files, ~ {
  modelo <- str_extract(.x, "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp126_2021-2040)")
  procesar_raster(.x, maskara, modelo, "meanFuture")
}) %>%
  dplyr::mutate(Year = "2021-2024", SSP = "SSP1 2.6")

# Guardar los resultados
write.csv(results, "ssp126_2021-2040/Mean_deltasBio.csv", row.names = F)