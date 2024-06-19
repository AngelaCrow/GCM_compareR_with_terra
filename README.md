# GCM_compareR_with_terra

Una serie de códigos que permiten replicar los análisis realizados por Fajardo et al. (2020) para comparar Modelos de circulación general (#MCG). 
1_Tablas_compareGCM.R 
-cargar y cortar el raster del presente y los raster de cada #MCG.
-guardar raster de los 19 bioclimas presente recortado a la región de interes.
-calcular el promedio global de cada uno de los bioclimas, tanto para el presente como para los #MCG.

2_Delta_del_Presente.R
-Calcula la diferencia entre los #MCG con respecto al presente, estos raster se guardan en la carpeta deltas de cada SSP y periodo
-Tambien se calculan el promedio global de cada uno de los raster de diferencia del presente a los #MCG.

3_Delta_ensemble.R
-Diferencias entre cada #MCG con respecto a un esamble de todos.
-Se guardan estos raster
-Calcula el promedio global de cada uno de los raster con respecto al ensamble.
