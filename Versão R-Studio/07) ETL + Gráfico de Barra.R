####################################
###    ETL + GRÁFICO DE BARRA    ###
####################################

# CARREGAR PACOTES
library(dplyr)
library(rstatix)
if(!require(ggplot2)) install.packages("ggplot2") 
library(ggplot2)
if(!require(plotly)) install.packages("plotly")
library(plotly)


# BUSCAR DIRETÓRIO (PASTA COM OS ARQUIVOS)
setwd("F:/Documentos/R/UDEMY/Gráfico")

# ABRIR ARQUIVO
srag_sp <- read.csv('SRAG_2020.csv', sep = ";")
View(srag_sp)

# EXCLUIR COLUNAS POR INTERVALO
srag_sp_mod <- select(srag_sp, -c(51:133))
srag_sp_mod <- select(srag_sp_mod, -c(5:8))
View(srag_sp_mod)

#EXCLUIR COLUNAS ESPECÍFICAS
srag_sp_mod <- select(srag_sp_mod, -c(6,8))

glimpse(srag_sp_mod)

#MUDANDO O TIPO DA DATA
srag_sp_mod$DT_NOTIFIC <- as.Date(srag_sp_mod$DT_NOTIFIC, format ='%m/%d/%Y')

# RENOMEANDO VARIÁVEIS (colunas)
srag_sp_mod <- rename(srag_sp_mod, sexo = CS_SEXO, idade = NU_IDADE_N)
View(srag_sp_mod)


# Verificando valores missing (Ausentes)
# NA = valores ausentes
# NAN = not a number(valor indefinido)
sapply(srag_sp_mod, function(x) sum(is.na(x)))
sapply(srag_sp_mod, function(x) sum(is.nan(x)))

#==================
# GRÁFICO DE BARRAS
#==================

# Contagem COLUNA sexo
table(srag_sp_mod$sexo)

barplot(srag_sp_mod$sexo,col="blue")


grafico_barras=table(srag_sp_mod$sexo)
barplot(grafico_barras, col="yellow", main="QUANTIDADE POR SEXO")

#==============
# COM O GGPLOT2
#==============
ggplot(srag_sp_mod, aes(x = sexo)) +
  geom_bar(fill ='red')+ labs(title="Quantidade por sexo",
                              subtitle = "SRAG",
                              x = "Sexo", y = "Contagem")



# GRÁFICO POR RAÇA
sapply(srag_sp_mod, function(x) sum(is.na(x)))
sapply(srag_sp_mod, function(x) sum(is.nan(x)))
srag_sp_mod$CS_RACA[which(is.na(srag_sp_mod$CS_RACA))] <- 9
View(srag_sp_mod)

srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 1] <- "Branca"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 2] <- "Preta"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 3] <- "Amarela"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 4] <- "Parda"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 5] <- "Ind?gena"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 9] <- "Ignorado"


# Contagem 
table(srag_sp_mod$CS_RACA)

grafico_barras=table(srag_sp_mod$CS_RACA)
barplot(grafico_barras, col="yellow", main="QUANTIDADE POR raça")


# COM O GGPLOT2
ggplot(srag_sp_mod, aes(x = CS_RACA)) +
  geom_bar(fill ='blue')+ labs(title="Quantidade por raça",
                               subtitle = "SRAG",
                               x = "raça", y = "Contagem")



# GRÁFICO POR RAÇA, SEXO e REGIÃO

sapply(srag_sp_mod, function(x) sum(is.na(x)))
srag_sp_mod$CS_ZONA[which(is.na(srag_sp_mod$CS_ZONA))] <- 9

srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 1] <- "Urbana"
srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 2] <- "Rural"
srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 3] <- "Periurbana"
srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 9] <- "Ignorado"

table(srag_sp_mod$CS_ZONA)

ggplot(srag_sp_mod, aes(x = CS_RACA, y = sexo, fill = factor(CS_ZONA))) +
  geom_col(position = "dodge") +
  labs(title = "Região por sexo e raça",
       x = "Raça",
       y = "Sexo",
       fill = "Região")


