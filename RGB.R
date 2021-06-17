
#RGB de aves

#Pacotes
library(raster)
library(rgdal)

#Bandas
r <- raster("Amazona_brasiliensis.tif", band = 3)
r

g <- raster("Amazona_brasiliensis.tif", band = 2)
g

b <- raster("Amazona_brasiliensis.tif", band = 1)
b

#Unindo as bandas
rgb <- brick(b,g,r)

#Visualização dos dados
plot(rgb)
hist(rgb)
plotRGB(rgb, r = 3, g= 2, b = 1, stretch = "lin")
