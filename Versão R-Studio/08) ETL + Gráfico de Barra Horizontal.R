###############################################
###    ETL + GRÁFICO DE BARRA HORIZONTAL    ###
###############################################

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


sapply(srag_sp_mod, function(x) sum(is.na(x)))
sapply(srag_sp_mod, function(x) sum(is.nan(x)))
srag_sp_mod$CS_RACA[which(is.na(srag_sp_mod$CS_RACA))] <- 9
View(srag_sp_mod)

srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 1] <- "Branca"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 2] <- "Preta"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 3] <- "Amarela"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 4] <- "Parda"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 5] <- "IndÍgena"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 9] <- "Ignorado"



# GrÁfico de barras na horizontal
ggplot(srag_sp_mod, aes(x = CS_RACA, y = sexo, fill = factor(CS_ZONA))) +
  geom_col(position = "dodge", fill='cond') +
  labs(title = "Região por sexo e raça",
       x = "Raça",
       y = "Sexo",
       fill = "Região") +
  coord_flip()




#EIXO X ->   aes(X=COLUNA DA TABELA)
#EIXO Y ->   aes(Y=COLUNA DA TABELA)
#LEGENDA ->  aes( fill = factor(COLUNA DA TABELA)