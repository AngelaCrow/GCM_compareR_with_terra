# Librerías necesarias
library(terra)
library(dplyr)

rm(list=ls())

# Cargar la máscara
maskara <- terra::rast("malla_1kmPR_sI_g.tif")

# Definir la ruta de los archivos del futuro
ruta_futuro <- "ssp126_2021-2040"

# Obtener todos los archivos del futuro
archivos_futuro <- list.files(ruta_futuro, full.names = TRUE, pattern = ".tif$")

# Nombres de los GCMs (extraídos de los nombres de archivo, puedes ajustarlos según corresponda)
gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp126_2021-2040)");gcm_names

# Función para recortar y retornar el primer layer de cada archivo
crop_raster <- function(file, mask) {
  cropped <-terra::crop(terra::rast(file), mask)
  #raster <- terra::rast(file)
  #cropped <- terra::crop(raster, mask)
  #return(cropped[[1]])  # Devolver el primer layer
}

# Aplicar el recorte a todos los archivos y almacenar en una lista
raster_list <- lapply(archivos_futuro, crop_raster, mask = maskara)

# Calcular el promedio (ensemble) de los layers recortados
ens_bios_GCM <- Reduce("+", raster_list) / length(raster_list)

calculate_stats <- function(raster, ensemble, name) {
  diff_raster <- raster - ensemble
  
  # Generar nombre de archivo de salida
  nombre_salida <- paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltasEnsamble/dE.", name, "_ssp126_2021-2040.tif")
  
  terra::writeRaster(diff_raster, nombre_salida, overwrite = TRUE)
  
  mean_val <- terra::global(diff_raster, fun = mean, na.rm = TRUE)
  
  stats <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                      x.mean = mean_val, 
                      GCM = name, 
                      Delta = "Between GCM",
                      SSP = "NULL"
                      )

  return(stats)
}

# Calcular estadísticas para cada GCM y combinar en un solo DataFrame
Bios_between_GCM <- do.call(rbind, Map(calculate_stats, raster_list, MoreArgs = list(ensemble = ens_bios_GCM), name = gcm_names))

# Guardar los resultados en un archivo CSV
write.csv(Bios_between_GCM, "ssp126_2021-2040/dBios_between_GCM.csv", row.names = FALSE)

# Añadir estadísticas del Ensemble
ensemble_stats <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                             x.mean = global(ens_bios_GCM, fun = mean, na.rm = TRUE),
                             GCM = "Ensemble", 
                             Delta = "NULL",
                             SSP = "NULL"
                             )

# Guardar los resultados en un archivo CSV
write.csv(ensemble_stats, "ssp126_2021-2040/ensamble_GCM.csv", row.names = FALSE)
