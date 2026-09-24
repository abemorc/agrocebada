# Predicción de Rendimiento de Cebada - Reto AgroCebada 2026

## Descripción del Proyecto
Este repositorio contiene el código y la metodología desarrollada para el Reto AgroCebada 2026. El objetivo principal es construir un modelo predictivo espacial para estimar el rendimiento agrícola (toneladas por hectárea) de 197 parcelas de cultivo de cebada en la región central de México (Hidalgo, Puebla y Tlaxcala) durante el ciclo abril-octubre 2025.

El análisis integra múltiples fuentes de datos espaciales y de percepción remota, incluyendo:
* Imágenes Satelitales: Índices de vegetación (NDVI, EVI, LAI, etc.) de Sentinel-2, Landsat y Planet.
* Variables Climáticas: Series de tiempo rasterizadas de precipitación mensual (CHIRPS) y temperatura mínima/máxima (CHIRTS-ERA5).
* Topografía: Modelos de elevación y pendiente (CEM 4.0 - INEGI).
* Geometrías: Datos vectoriales de las parcelas objetivo.

## Tecnologías y Paquetes Requeridos
El proyecto está desarrollado completamente en R. Para reproducir los scripts, es necesario tener instalados los siguientes paquetes:
* tidyverse (Manipulación de datos y visualización tabular)
* sf (Manejo de datos espaciales vectoriales - Simple Features)
* terra (Procesamiento de datos espaciales raster y álgebra de mapas)
* mapview / tmap (Visualización espacial interactiva)

## Estructura de Datos (Importante)
Por restricciones de peso y mejores prácticas de control de versiones, los datos crudos no están incluidos en este repositorio. 


## Metodología
1. Consolidación Vectorial: Integración de los polígonos de las parcelas con los datos tabulares de rendimiento.
2. Extracción Espacial (Zonal Statistics): Intersección de las geometrías de las parcelas con las capas topográficas y climáticas continuas.
3. Procesamiento Temporal: Agregación de índices satelitales limitados al ciclo de cultivo (abril-octubre).
4. Modelado Predictivo: (En desarrollo) Construcción del modelo de Machine Learning/Estadístico utilizando el conjunto de características derivadas.


