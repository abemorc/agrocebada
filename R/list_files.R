# Definir la ruta de tu carpeta principal
ruta_rawdata <- "RawData"

# 1. Obtener la ruta de TODOS los archivos dentro de la carpeta y subcarpetas
rutas_archivos <- list.files(path = ruta_rawdata, 
                             full.names = TRUE, 
                             recursive = TRUE)

# 2. Extraer la información del sistema (tamaño, fechas, permisos)
info_detallada <- file.info(rutas_archivos)

# 3. Construir un Data Frame estructurado y fácil de leer
inventario_archivos <- data.frame(
  # Extraemos solo el nombre final del archivo
  Archivo = basename(rownames(info_detallada)),
  
  # Conservamos la ruta completa por si necesitas copiarla luego
  Ruta = rownames(info_detallada),
  
  # Convertimos el tamaño de bytes a Megabytes (MB) para mejor lectura
  Tamaño_MB = round(info_detallada$size / (1024 * 1024), 3),
  
  # Fecha de última modificación
  Modificacion = info_detallada$mtime,
  row.names = NULL
)

# 4. Mostrar el resultado en la consola
print(inventario_archivos)

# (Opcional) Si estás usando RStudio, esto abre una pestaña interactiva 
# donde puedes filtrar y ordenar la tabla como en Excel:
View(inventario_archivos)




write_csv(inventario_archivos, file = 'RawData/inventario-archivos.csv')


