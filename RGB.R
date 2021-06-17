
#RGB de aves
# data create: 16-16-2021
#data lest edit: 17-06-2021
# Autor: Ingrid Lima, edit by Victor Leandro-Silva

# seed
set.seed(1)

# dir
setwd(choose.dir())


#Pacotes
library(raster)
library(rgdal)

# lista imagens
ti <- dir(pattern = ".tif$")
ti

# importa todos
#var <- raster::stack(ti)
#var

#Bandas
for(i in 1:length(ti)){
#r <- raster("Amazona_brasiliensis.tif", band = 3)
#r
#g <- raster("Amazona_brasiliensis.tif", band = 2)
#g
#b <- raster("Amazona_brasiliensis.tif", band = 1)
#b
var <-  raster::stack(ti[i])
r - <- raster::raster(var, band = 3)
g - <- raster::raster(var, band = 2)
b - <- raster::raster(var, band = 1)

#Unindo as bandas
rgb <- brick(b,g,r)

#Visualização dos dados
p <- plot(rgb)
tiff(paste0("plot_", ti, ".tif")); plot(p); dev.off()
  
h <- hist(rgb)
tiff(paste0("hist_", ti, ".tif")); plot(h); dev.off()
  
p.rgb <- plotRGB(rgb, r = 3, g= 2, b = 1, stretch = "lin")
tiff(paste0("plot_rgb", ti, ".tif")); plot(p.rgb); dev.off()


}
