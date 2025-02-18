
################################################
# D: Converter jpg em tiff
# Autor: Victor Leandro-silva, Ingrid Lima
# Cria��o: 19-06-2021
# �ltima edi��o: 21-06-2021
################################################

#dir
setwd("C:/Users/ingri/Documents/GitHub/RGB/imagem_para_cor")
getwd()
dir()

#package
library(imager)
library(ggplot2)

# Lista imagens dentro da pasta
ti <- dir(pattern = ".jpg")
ti

i <- 1
#Convers�o
while (i < 328) {
  setwd("C:/Users/ingri/Documents/GitHub/RGB/imagem_para_cor") #diret�rio com imagens JPEG
  d <- load.image(ti[i])
  plot(d)
  thmb <- resize(d)
  setwd("C:/Users/ingri/Documents/imagens_tif") #Lugar onde vai salvar as imagens
  p <- raster::plot(thmb)
  tiff(p, filename = ti[i]) #cria um tiff vazia
  dev.off()
  i <- i + 1 # pasta para salvar os tiff
}
