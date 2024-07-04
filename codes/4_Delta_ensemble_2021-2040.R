# Librerías necesarias
library(terra)
library(dplyr)
library(stringr)
library(purrr)

rm(list=ls())

# Cargar la máscara
#maskara <- terra::rast("malla_1kmPR_sI_g.tif")
maskara <- terra::vect("malla_1kmPR_sI_g.shp")
ruta<-"/Volumes/TOSHIBA EXT/COBERTURAS/WC/"

####ssp126####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "ssp126_2021-2040"

# Crear un directorio para los deltas si no existe
dir.create(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/",ruta_futuro,"/deltasEnsamble"), showWarnings = FALSE)

# Obtener todos los archivos del futuro
archivos_futuro <- list.files(paste0(ruta,ruta_futuro), full.names = TRUE, pattern = ".tif$");archivos_futuro

# Nombres de los GCMs (extraídos de los nombres de archivo, puedes ajustarlos según corresponda)
gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp126_2021-2040)");gcm_names

# Función para recortar y retornar el primer layer de cada archivo
crop_raster <- function(file, mask) {
  cropped <-terra::crop(terra::rast(file), mask)
  cropped <-terra::mask(cropped, mask)
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
                      Year = "2021-2040",
                      SSP = "SSP1 2.6",
                      Tipo = "dBios_between_GCM_ssp126_2021-2040"
                      )

  return(stats)
}

# Calcular estadísticas para cada GCM y combinar en un solo DataFrame
Bios_between_GCM1 <- do.call(rbind, Map(calculate_stats, raster_list, MoreArgs = list(ensemble = ens_bios_GCM), name = gcm_names))

# Añadir estadísticas del Ensemble
ensemble_stats1 <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                             x.mean = global(ens_bios_GCM, fun = mean, na.rm = TRUE),
                             GCM = "Ensemble", 
                             Year = "2021-2040",
                             SSP = "SSP1 2.6",
                             Tipo = "d.Ensamble_GCM_ssp126_2021-2040"
                             )

rm(ruta_futuro)

####ssp370####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "ssp370_2021-2040"

# Crear un directorio para los deltas si no existe
dir.create(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/",ruta_futuro,"/deltasEnsamble"), showWarnings = FALSE)

# Obtener todos los archivos del futuro
archivos_futuro <- list.files(paste0(ruta,ruta_futuro), full.names = TRUE, pattern = ".tif$");archivos_futuro

# Nombres de los GCMs (extraídos de los nombres de archivo, puedes ajustarlos según corresponda)
gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp370_2021-2040)");gcm_names

# Función para recortar y retornar el primer layer de cada archivo
crop_raster <- function(file, mask) {
  cropped <-terra::crop(terra::rast(file), mask)
  cropped <-terra::mask(cropped, mask)
}

# Aplicar el recorte a todos los archivos y almacenar en una lista
raster_list <- lapply(archivos_futuro, crop_raster, mask = maskara)

# Calcular el promedio (ensemble) de los layers recortados
ens_bios_GCM <- Reduce("+", raster_list) / length(raster_list)

calculate_stats <- function(raster, ensemble, name) {
  diff_raster <- raster - ensemble
  
  # Generar nombre de archivo de salida
  nombre_salida <- paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp370_2021-2040/deltasEnsamble/dE.", name, "_ssp370_2021-2040.tif")
  
  terra::writeRaster(diff_raster, nombre_salida, overwrite = TRUE)
  
  mean_val <- terra::global(diff_raster, fun = mean, na.rm = TRUE)
  
  stats <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                      x.mean = mean_val, 
                      GCM = name, 
                      Year = "2021-2040",
                      SSP = "SSP3 7.0",
                      Tipo = "dBios_between_GCM_ssp370_2021-2040"
  )
  
  return(stats)
}

# Calcular estadísticas para cada GCM y combinar en un solo DataFrame
Bios_between_GCM2 <- do.call(rbind, Map(calculate_stats, raster_list, MoreArgs = list(ensemble = ens_bios_GCM), name = gcm_names))

# Añadir estadísticas del Ensemble
ensemble_stats2 <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                             x.mean = global(ens_bios_GCM, fun = mean, na.rm = TRUE),
                             GCM = "Ensemble", 
                             Year = "2021-2040",
                             SSP = "SSP3 7.0",
                             Tipo = "d.Ensamble_GCM_ssp370_2021-2040"
)

rm(ruta_futuro)

####ssp585####
# Definir la ruta de los archivos del futuro
ruta_futuro <- "ssp585_2021-2040"

# Crear un directorio para los deltas si no existe
dir.create(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/",ruta_futuro,"/deltasEnsamble"), showWarnings = FALSE)

# Obtener todos los archivos del futuro
archivos_futuro <- list.files(paste0(ruta,ruta_futuro), full.names = TRUE, pattern = ".tif$");archivos_futuro

# Nombres de los GCMs (extraídos de los nombres de archivo, puedes ajustarlos según corresponda)
gcm_names <- str_extract(basename(archivos_futuro), "(?<=wc2\\.1_30s_bioc_)[^_]+(?=_ssp585_2021-2040)");gcm_names

# Función para recortar y retornar el primer layer de cada archivo
crop_raster <- function(file, mask) {
  cropped <-terra::crop(terra::rast(file), mask)
  cropped <-terra::mask(cropped, mask)
}

# Aplicar el recorte a todos los archivos y almacenar en una lista
raster_list <- lapply(archivos_futuro, crop_raster, mask = maskara)

# Calcular el promedio (ensemble) de los layers recortados
ens_bios_GCM <- Reduce("+", raster_list) / length(raster_list)

calculate_stats <- function(raster, ensemble, name) {
  diff_raster <- raster - ensemble
  
  # Generar nombre de archivo de salida
  nombre_salida <- paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp585_2021-2040/deltasEnsamble/dE.", name, "_ssp585_2021-2040.tif")
  
  terra::writeRaster(diff_raster, nombre_salida, overwrite = TRUE)
  
  mean_val <- terra::global(diff_raster, fun = mean, na.rm = TRUE)
  
  stats <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                      x.mean = mean_val, 
                      GCM = name, 
                      Year = "2021-2040",
                      SSP = "SSP5 8.5",
                      Tipo = "dBios_between_GCM_ssp585_2021-2040"
  )
  
  return(stats)
}

# Calcular estadísticas para cada GCM y combinar en un solo DataFrame
Bios_between_GCM3 <- do.call(rbind, Map(calculate_stats, raster_list, MoreArgs = list(ensemble = ens_bios_GCM), name = gcm_names))

# Unir los resultados de cada ssp
Bios_between_GCM<-rbind(Bios_between_GCM1,Bios_between_GCM2,Bios_between_GCM3)

# Guardar los resultados en un archivo CSV
write.csv(Bios_between_GCM, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/dBios_between_GCM_2021-2040.csv", row.names = FALSE)

# Añadir estadísticas del Ensemble
ensemble_stats3 <- data.frame(Variable = paste("wc2_", 1:19, sep = ""),
                             x.mean = global(ens_bios_GCM, fun = mean, na.rm = TRUE),
                             GCM = "Ensemble", 
                             Year = "2021-2040",
                             SSP = "SSP5 8.5",
                             Tipo = "d.Ensamble_GCM_ssp585_2021-2040"
)

# Unir los resultados de cada ssp
ensemble_stats<-rbind(ensemble_stats1,ensemble_stats2,ensemble_stats3)

# Guardar los resultados en un archivo CSV
write.csv(ensemble_stats, paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/ensamble_GCM_2021-2040.csv"), row.names = FALSE)

rm(ruta_futuro)
