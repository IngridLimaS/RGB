
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
for(i in 1:length(ti)){
var <-  raster::stack(ti[i])
var

r <- raster::raster(ti[i], band = 3)
g <- raster::raster(ti[i], band = 2)
b <- raster::raster(ti[i], band = 1)


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


# Salvar frequencia das bandas em .csv

#Via 01
hist2csv <- function(h, csv_path)
{
  df <-  data.frame(breaks = h$breaks,   counts = c(h$counts, 1),
                    density = c(h$density, 1), mids = c(h$mids, 1),
                    xname = rep(h$xname, length(h$breaks)), 
                    equidist = rep(T, length(h$breaks)))
  
  write.csv(df, csv_path)
}

# Via 02
out  <- data.frame(mid = h$mids, counts = h$counts)
out
write.table(out, file = "export.csv", row.names = FALSE, sep = ",")
write.csv(h, "RBG_aves.csv")
