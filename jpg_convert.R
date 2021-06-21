
################################################
# D: Converter jpg em tiff
# Autor: Victor Leandro-silva, Ingrid Lima
# Criação: 19-06-2021
# Última edição: 21-06-2021
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
#Conversão
while (i < 328) {
  setwd("C:/Users/ingri/Documents/GitHub/RGB/imagem_para_cor") #diretório com imagens JPEG
  d <- load.image(ti[i])
  plot(d)
  thmb <- resize(d)
  setwd("C:/Users/ingri/Documents/imagens_tif") #Lugar onde vai salvar as imagens
  p <- raster::plot(thmb)
  tiff(p, filename = ti[i]) #cria um tiff vazia
  dev.off()
  i <- i + 1 # pasta para salvar os tiff
}
