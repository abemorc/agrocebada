
library(tidyverse)
library(sf)
library(terra)
library(spData)
library(spDataLarge)

raster_filepath = system.file("raster/srtm.tif", package = "spDataLarge")
my_rast = rast(raster_filepath)
class(my_rast)
#> [1] "SpatRaster"
#> attr(,"package")
#> [1] "terra"
#> 
my_rast


luxembourg = world[world$name_long == "Luxembourg", ]
st_area(luxembourg) # requires the s2 package in recent versions of sf
#> 2.41e+09 [m^2]
#> 
attributes(st_area(luxembourg))



res(my_rast)
methods(class = "sf") # methods for sf objects, first 12 shown


class(world)


glimpse(world)


world7 = world |>
  filter(continent == "Asia") |>
  select(name_long, continent) |>
  slice(1:5)

world7 |> 
  select(geom) |> 
  plot()





# 1. Obtener la lista de todos los archivos .zip en la carpeta RawData
archivos_zip <- list.files(path = "RawData", pattern = "\\.zip$", full.names = TRUE)

# 2. Imprimir el contenido de cada uno
invisible(lapply(archivos_zip, function(archivo) {
  cat("\n========================================\n")
  cat("CONTENIDO DE:", archivo, "\n")
  cat("========================================\n")
  print(unzip(archivo, list = TRUE))
}))
