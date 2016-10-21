# Fuentes de datos

Directorio de datos usados en clase

## Datos externos

### Accidentes de tren

Contiene los accidentes de trenes del año 2015 en Estados Unidos.

La descripción de la página web dice:

    This file contains reported cases of collisions, derailments, fires, explosions, 
    acts of God, or other events involving the operation of railroad on-track equipment 
    and involving damages exceeding the reporting threshold for the year reported.
    National files from 1975 through the current year are available for download. 

Lo obtuve de esta página [FRA Office of Safety Analysis Web Site](http://safetydata.fra.dot.gov/officeofsafety/default.aspx)

- En el menú de Downloads y seleccioné **Accident Data as reported by Railroads**.
- Elegí los parámetros por default, y pedí que la descarga fuera en formato `TXT` (en realidad es un `csv`).

El significado de cada columna se puede ver en el archivo `accfile_ThruMay2011.pdf` 
también en la carpeta `accidentes`


## Datos simulados

Desde la carpeta raíz del repositorio

### Groceries

Basado en el `gist` https://gist.github.com/randyzwitch/c44ff2a76d81fa1e77cb

Ejecuta:

```{shell}
Rscript -e 'library(arules);data("Groceries");write(Groceries, "data/groceries.txt", sep=",")'
python data/groceries-gen.py
```

### Apache Logs


Pequeñas modificaciones  a partir del repositorio  https://github.com/kiritbasu/Fake-Apache-Log-Generator

Ejecuta:

```{shell}
## Ingresa a la carpeta data para este comando
python apache-log-generator.py -n 10000 -o LOG
```

Para otras formas de ejecutar, ver el `README` de ese repositorio.


### Power Grid

Tomado del capítulo 1 *Power Grid Data Analysis with R and Hadoop*
del libro **Data Mining applications with R** de Yanchang Zhao y Yonghua Cen

Ejecuta:

```{sh}
Rscript power-grid-gen.r
```

Este comando generará un archivo `rds` con datos simulados
de una planta de generación eléctrica.
