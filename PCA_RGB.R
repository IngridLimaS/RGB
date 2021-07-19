
#PCA (RGB-Aves)

#Definir diretório
setwd(choose.dir())
dir()

#Pacotes
library(FactoMineR)
library(factoextra)

#Carregar os dados
dados = read.csv("RBG_bandas.csv",header=TRUE)

#Verificar os dados
str(dados)
summary(dados)
View(dados)
plot(dados)

# Criar subconjuntos ativos (Linhas) e variáveis ativas (Colunas)
RGB_active<- dados [1:327, 2:4]

#Visualizar dados
View(RGB_active)

#Gerar PCA
RGB_PCA <- PCA(RGB_active, graph = F)

#Extrair variancia dos valores
RGB_val <- get_eigenvalue(RGB_PCA)
RGB_val

#Plotar variancia
fviz_eig(RGB_PCA, addlabels = T, ylim = c(0,90))

#Extrair resultados das variaveis
var <- get_pca_var(RGB_PCA)
ind <- get_pca_ind(RGB_PCA)

#Plotar grafico PCA
fviz_pca_var(RGB_PCA, col.var = "black")

#Criar grupo para cluster
grupo <- as.factor(dados[,1])
grupo

#Plotar Grafico biplot
fviz_pca_biplot(RGB_PCA)

#Verificar qualidade da representação
var$cos2

corrplot(var$cos2, is.corr = F)



