
############################################
# RGB de aves
# Data create: 16-16-2021
# Data lest edit: 17-06-2021
# Autor: Ingrid Lima, Victor Leandro-Silva
############################################

# seed
set.seed(1)

# dir
setwd(choose.dir())
dir()


# Pacotes
library(raster)
library(rgdal)
library(sp)
library(imager)
library(ggplot2)
library(dplyr)


# lista imagens
ti <- dir(pattern = ".tif$")
ti

# importa todos
#var <- raster::stack(ti)
#var

# Bandas
#r <- raster("Amazona_brasiliensis.tif", band = 3)
#r
#g <- raster("Amazona_brasiliensis.tif", band = 2)
#g
#b <- raster("Amazona_brasiliensis.tif", band = 1)
#b

i<-1
for(i in 11:length(ti)){
var <-  raster::stack(ti[i])
var

r <- raster::raster(ti[i], band = 3)
r
g <- raster::raster(ti[i], band = 2)
g
b <- raster::raster(ti[i], band = 1)
b

# União das bandas
rgb <- brick(r,g,b)

# Visualização dos dados
p <- plot(rgb)
tiff(paste0("plot_", ti, ".tif")); plot(p); dev.off()
  
h <- hist(rgb)
h
tiff(paste0("hist_", ti, ".tif")); plot(h); dev.off()
  
p.rgb <- plotRGB(rgb, r = 3, g= 2, b = 1, stretch = "lin")
tiff(paste0("plot_rgb", ti, ".tif")); plot(p.rgb); dev.off()


}

#Visualização das bandas

plot(r)
band_R<-hist(r)
band_R

plot(g)
band_G<-hist(g)
band_G

plot(b)
band_B<-hist(b)
band_B


# Salvar frequencia das bandas em .csv

#R
out  <- data.frame(mid = band_R$mids, counts = band_R$counts)
out
write.table(out, file = "band_R.csv", row.names = FALSE, sep = ",")

#G
out  <- data.frame(mid = band_G$mids, counts = band_G$counts)
out
write.table(out, file = "band_G.csv", row.names = FALSE, sep = ",")

#B
out  <- data.frame(mid = band_B$mids, counts = band_B$counts)
out
write.table(out, file = "band_B.csv", row.names = FALSE, sep = ",")


