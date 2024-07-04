# Librerías necesarias
library(dplyr)
library(ggplot2)
library(tidyr)

#Diferencia con respecto al presente####
rm(list=ls())
ruta_tablas <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC"
csvs <- list.files(paste0(ruta_tablas), full.names = TRUE, pattern = ".csv$", recursive = T);csvs
csvs<- csvs[grepl("^(dBios|Mean_deltas)", basename(csvs))]
data_ <- do.call(rbind, lapply(csvs, read.csv))
unique(data_$Tipo)

#2021-2040####
# Filtrar filas donde la columna 'Tipo' contiene 'deltas_ssp126'
data <- data_ %>%
  filter(grepl("deltas_", Tipo)) %>% 
  filter(Variable %in% c("wc2_1", "wc2_12")) %>%
  filter(Year == "2021-2040") %>% 
  mutate(Variable = case_when(
    Variable == "wc2_1" ~ "Temperatura",
    Variable == "wc2_12" ~ "Precipitación")) %>% 
  pivot_wider(names_from = Variable, values_from = mean)
 

# Obtener los valores únicos de 'Tipo'
tipos_unicos <- unique(data$Tipo)

# Función para crear y guardar gráficos
crear_grafico <- function(tipo) {
  # Filtrar los datos por el tipo actual
  deltas <- data %>%
    filter(Tipo == tipo) %>%
    filter(Year == "2021-2040") 
  
  # Calcular el promedio de Temperatura y Precipitación
  mean_temp <- mean(deltas$Temperatura, na.rm = TRUE)
  mean_prec <- mean(deltas$Precipitación, na.rm = TRUE)
  
  # Crear el gráfico
  p <- ggplot(deltas, aes(x = Temperatura, y = Precipitación, label = GCM)) +
    geom_point(color = "gray40", size = 4) +  # Puntos en gris oscuro
    geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje x
    geom_vline(xintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje y
    geom_point(aes(x = 0, y = 0), color = "blue", size = 5, shape = 21, fill = "white") +  # Punto azul en la intersección
    geom_point(aes(x = mean_temp, y = mean_prec), color = "red", size = 5, shape = 23, fill = "red") +  # Punto rojo para el promedio
    geom_text(hjust = 0.5, vjust = -1, size = 3, color = "black") +  # Etiquetas de texto
    annotate("text", x = -0.2, y = 0, label = "Baseline", angle = 0, color = "blue", vjust = -1.5) +
    annotate("text", x = mean_temp, y = mean_prec, label = "Promedio", angle = 0, color = "red", vjust = -1.5, size = 3) +  # Texto "Promedio"
    theme_minimal() +  # Tema minimalista
    theme(
      axis.title.x = element_text(size = 12),  # Título del eje x
      axis.title.y = element_text(size = 12),  # Título del eje y
      axis.text.x = ,   # Eliminar texto del eje x
      axis.text.y = ,   # Eliminar texto del eje y
      axis.ticks = ,    # Eliminar marcas de los ejes
      panel.grid =      # Eliminar líneas de la cuadrícula
    ) +
    labs(
      title = "Cambio con respecto al presente",
      subtitle = gsub("deltas_","",paste(tipo)),
      x = "Temperature (ºC)",  # Etiqueta del eje x
      y = "Precipitation (mm)"  # Etiqueta del eje y
    )
  
  # Guardar el gráfico
  ggsave(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/", tipo, ".jpg"), plot = p)
}

# Iterar sobre cada tipo único y crear los gráficos
for (tipo in tipos_unicos) {
  crear_grafico(tipo)
}

#2041-2060####
# Filtrar filas donde la columna 'Tipo' contiene 'deltas_ssp126'
data <- data_ %>%
  filter(grepl("deltas_", Tipo)) %>% 
  filter(Variable %in% c("wc2_1", "wc2_12")) %>%
  filter(Year == "2041-2060") %>% 
  mutate(Variable = case_when(
    Variable == "wc2_1" ~ "Temperatura",
    Variable == "wc2_12" ~ "Precipitación")) %>% 
  pivot_wider(names_from = Variable, values_from = mean)


# Obtener los valores únicos de 'Tipo'
tipos_unicos <- unique(data$Tipo)

# Función para crear y guardar gráficos
crear_grafico <- function(tipo) {
  # Filtrar los datos por el tipo actual
  deltas <- data %>%
    filter(Tipo == tipo) %>%
    filter(Year == "2041-2060") 
  
  # Calcular el promedio de Temperatura y Precipitación
  mean_temp <- mean(deltas$Temperatura, na.rm = TRUE)
  mean_prec <- mean(deltas$Precipitación, na.rm = TRUE)
  
  # Crear el gráfico
  p <- ggplot(deltas, aes(x = Temperatura, y = Precipitación, label = GCM)) +
    geom_point(color = "gray40", size = 4) +  # Puntos en gris oscuro
    geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje x
    geom_vline(xintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje y
    geom_point(aes(x = 0, y = 0), color = "blue", size = 5, shape = 21, fill = "white") +  # Punto azul en la intersección
    geom_point(aes(x = mean_temp, y = mean_prec), color = "red", size = 5, shape = 23, fill = "red") +  # Punto rojo para el promedio
    geom_text(hjust = 0.5, vjust = -1, size = 3, color = "black") +  # Etiquetas de texto
    annotate("text", x = -0.2, y = 0, label = "Baseline", angle = 0, color = "blue", vjust = -1.5) +
    annotate("text", x = mean_temp, y = mean_prec, label = "Promedio", angle = 0, color = "red", vjust = -1.5, size = 3) +  # Texto "Promedio"
    theme_minimal() +  # Tema minimalista
    theme(
      axis.title.x = element_text(size = 12),  # Título del eje x
      axis.title.y = element_text(size = 12),  # Título del eje y
      axis.text.x = ,   # Eliminar texto del eje x
      axis.text.y = ,   # Eliminar texto del eje y
      axis.ticks = ,    # Eliminar marcas de los ejes
      panel.grid =      # Eliminar líneas de la cuadrícula
    ) +
    labs(
      title = "Cambio con respecto al presente",
      subtitle = gsub("deltas_","",paste(tipo)),
      x = "Temperature (ºC)",  # Etiqueta del eje x
      y = "Precipitation (mm)"  # Etiqueta del eje y
    )
  
  # Guardar el gráfico
  ggsave(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/", tipo, ".jpg"), plot = p)
}

# Iterar sobre cada tipo único y crear los gráficos
for (tipo in tipos_unicos) {
  crear_grafico(tipo)
}

#Variación entre GCM####
rm(list=ls())
ruta_tablas <- "/Volumes/TOSHIBA EXT/COBERTURAS/WC"
csvs <- list.files(paste0(ruta_tablas), full.names = TRUE, pattern = ".csv$", recursive = T);csvs
csvs<- csvs[grepl("^(dBios|Mean_deltas)", basename(csvs))]
data_ <- do.call(rbind, lapply(csvs, read.csv))
unique(data_$Tipo)

#2021-2040####
# Filtrar filas donde la columna 'Tipo' contiene 'deltas_ssp126'
data <- data_ %>%
  filter(grepl("dBios_between_", Tipo)) %>% 
  filter(Variable %in% c("wc2_1", "wc2_12")) %>%
  filter(Year == "2021-2040") %>% 
  mutate(Variable = case_when(
    Variable == "wc2_1" ~ "Temperatura",
    Variable == "wc2_12" ~ "Precipitación")) %>% 
  pivot_wider(names_from = Variable, values_from = mean)


# Obtener los valores únicos de 'Tipo'
tipos_unicos <- unique(data$Tipo)

# Función para crear y guardar gráficos
crear_grafico <- function(tipo) {
  # Filtrar los datos por el tipo actual
  deltas <- data %>%
    filter(Tipo == tipo) %>%
    filter(Year == "2021-2040") 
  
  # Calcular el promedio de Temperatura y Precipitación
  mean_temp <- mean(deltas$Temperatura, na.rm = TRUE)
  mean_prec <- mean(deltas$Precipitación, na.rm = TRUE)
  
  # Crear el gráfico
  p <- ggplot(deltas, aes(x = Temperatura, y = Precipitación, label = GCM)) +
    geom_point(color = "gray40", size = 4) +  # Puntos en gris oscuro
    geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje x
    geom_vline(xintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje y
    geom_text(hjust = 0.5, vjust = -1, size = 3, color = "black") +  # Etiquetas de texto
    theme_minimal() +  # Tema minimalista
    theme(
      axis.title.x = element_text(size = 12),  # Título del eje x
      axis.title.y = element_text(size = 12),  # Título del eje y
      axis.text.x = ,   # Eliminar texto del eje x
      axis.text.y = ,   # Eliminar texto del eje y
      axis.ticks = ,    # Eliminar marcas de los ejes
      panel.grid =      # Eliminar líneas de la cuadrícula
    ) +
    labs(
      title = "Variación entre MCG",
      subtitle = gsub("deltas_","",paste(tipo)),
      x = "Temperature (ºC)",  # Etiqueta del eje x
      y = "Precipitation (mm)"  # Etiqueta del eje y
    )
  
  # Guardar el gráfico
  ggsave(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/", tipo, ".jpg"), plot = p)
}

# Iterar sobre cada tipo único y crear los gráficos
for (tipo in tipos_unicos) {
  crear_grafico(tipo)
}

#2041-2060####
# Filtrar filas donde la columna 'Tipo' contiene 'deltas_ssp126'
data <- data_ %>%
  filter(grepl("dBios_between_", Tipo)) %>% 
  filter(Variable %in% c("wc2_1", "wc2_12")) %>%
  filter(Year == "2041-2060") %>% 
  mutate(Variable = case_when(
    Variable == "wc2_1" ~ "Temperatura",
    Variable == "wc2_12" ~ "Precipitación")) %>% 
  pivot_wider(names_from = Variable, values_from = mean)


# Obtener los valores únicos de 'Tipo'
tipos_unicos <- unique(data$Tipo)

# Función para crear y guardar gráficos
crear_grafico <- function(tipo) {
  # Filtrar los datos por el tipo actual
  deltas <- data %>%
    filter(Tipo == tipo) %>%
    filter(Year == "2041-2060") 
  
  # Calcular el promedio de Temperatura y Precipitación
  mean_temp <- mean(deltas$Temperatura, na.rm = TRUE)
  mean_prec <- mean(deltas$Precipitación, na.rm = TRUE)
  
  # Crear el gráfico
  p <- ggplot(deltas, aes(x = Temperatura, y = Precipitación, label = GCM)) +
    geom_point(color = "gray40", size = 4) +  # Puntos en gris oscuro
    geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje x
    geom_vline(xintercept = 0, color = "black", linetype = "solid", size = 1) +  # Línea en el eje y
    geom_text(hjust = 0.5, vjust = -1, size = 3, color = "black") +  # Etiquetas de texto
    theme_minimal() +  # Tema minimalista
    theme(
      axis.title.x = element_text(size = 12),  # Título del eje x
      axis.title.y = element_text(size = 12),  # Título del eje y
      axis.text.x = ,   # Eliminar texto del eje x
      axis.text.y = ,   # Eliminar texto del eje y
      axis.ticks = ,    # Eliminar marcas de los ejes
      panel.grid =      # Eliminar líneas de la cuadrícula
    ) +
    labs(
      title = "Variación entre MCG",
      subtitle = gsub("deltas_","",paste(tipo)),
      x = "Temperature (ºC)",  # Etiqueta del eje x
      y = "Precipitation (mm)"  # Etiqueta del eje y
    )
  
  # Guardar el gráfico
  ggsave(paste0("/Volumes/TOSHIBA EXT/COBERTURAS/WC/", tipo, ".jpg"), plot = p)
}

# Iterar sobre cada tipo único y crear los gráficos
for (tipo in tipos_unicos) {
  crear_grafico(tipo)
}
