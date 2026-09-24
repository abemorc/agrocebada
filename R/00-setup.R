

library(tidyverse)
library(sf)
library(terra)
library(spData)
library(spDataLarge)
library(mapview)
library(tmap)

# 1. Definir las rutas exactas a partir de tu inventario
ruta_shp <- "RawData/Parcelas_Reto_AGC_CONJUNTO_70_30/Parcelas_Reto_AGC_CONJUNTO.shp"
ruta_csv <- "RawData/ID_area_rendimiento_70_30_Reto_AgroCebada.csv"


# 2. Importar los datos
sfParcelas <- read_sf(ruta_shp)

# Leer el archivo tabular de rendimientos
dfRendimiento <- read_csv(ruta_csv)

# 3. Exploración de seguridad
names(sfParcelas)
names(dfRendimiento)

sfParcelas1 <- sfParcelas %>%
  left_join(dfRendimiento, by = join_by(ID_POLIGON==ID_POLIGONO)) |> 
  relocate(geometry, .after = last_col())

sfParcelas1
sfParcelas

dfRendimiento


glimpse(sfParcelas1)
View(sfParcelas1)


sfParcelas1 |> 
  select(geometry) |> 
  plot()


# exploracion visual


# Mapeo interactivo coloreando por la columna CONJUNTO
mapview(sfParcelas1, zcol = "RENDIMIENTO_T_HA", alpha.regions = 0.5)







# 1. Limpiar el dataset y quitar la dimensión Z
sfParcelas1_limpio <- sfParcelas1 |> 
  # Eliminar la coordenada Z (pasa de POLYGON Z a POLYGON normal)
  st_zm() |> 
  # Limpiar las columnas duplicadas y la columna basura (...5)
  select(-CONJUNTO.y, -AREA_HA, -`...5`) |> 
  # Renombrar para que quede bonito
  rename(CONJUNTO = CONJUNTO.x)

# 2. Comprobar que la geometría ahora es 2D
glimpse(sfParcelas1_limpio) 

# 3. Crear el mapa de nuevo
mapview(sfParcelas1_limpio, zcol = "RENDIMIENTO_T_HA", alpha.regions = 0.5)


todas_las_variables <- setdiff(names(sfParcelas1_limpio), "geometry")
todas_las_variables
# Crear el mapa con todas las capas disponibles
mapview(sfParcelas1_limpio, zcol = todas_las_variables, alpha.regions = 0.6)


