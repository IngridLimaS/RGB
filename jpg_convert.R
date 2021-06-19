################################################
# D: Converter jpg em tiff
# Autor: Victor Leandro-silva, Ingrid Lima
# Data: 19-06-2021
################################################

#dir
setwd(choose.dir())
getwd()
dir()

#package
library(imager)

# Lista imagens dentro da pasta
ti <- dir(pattern = ".jpg")
ti
i <- 1

#
for (i in length(ti)) {
d <- load.image(ti[i])
thmb <- resize(d)
tiff() #cria um tiff vazia
plot(thmb)
dev.off()
setwd() # pasta para salvar os tiff
}